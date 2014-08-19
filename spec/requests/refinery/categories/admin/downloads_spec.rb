# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Categories" do
    describe "Admin" do
      describe "downloads" do
        login_refinery_user

        before do 
            @cat=FactoryGirl.create(:category, :title => "Refinery cat", :description => "Refinery desc")
            @subcat=FactoryGirl.create(:subcategory, :title => "Refinery subcat", :description => "Refinery desc", :category_id=>@cat.id)          
        end

        describe "downloads list" do
          before do
            FactoryGirl.create(:download, :title => "UniqueTitleOne", :subcategory_id => @subcat.id)
            FactoryGirl.create(:download, :title => "UniqueTitleTwo", :subcategory_id => @subcat.id)
          end

          it "shows two items" do
            visit refinery.categories_admin_downloads_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.categories_admin_downloads_path+"/new?id="+@subcat.id.to_s

            #click_link "Add New Download"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Categories::Download.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::Categories::Download.count.should == 0
            end
          end

          context "duplicate" do
            before do
                FactoryGirl.create(:download, :title => "UniqueTitle", :subcategory_id => @subcat.id)
                visit refinery.categories_admin_downloads_path+"/new?id="+@subcat.id.to_s                
            end

            it "should fail" do

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Categories::Download.count.should == 1
            end
          end

        end

        describe "edit" do
          before do
              FactoryGirl.create(:download, :title => "A Title", :subcategory_id => @subcat.id)
          end

          it "should succeed" do
            visit refinery.categories_admin_downloads_path

            within ".actions" do
              click_link "Edit this download"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before do
              FactoryGirl.create(:download, :title => "A Title one", :subcategory_id => @subcat.id)            
          end

          it "should succeed" do
            visit refinery.categories_admin_downloads_path

            click_link "Remove this download forever"

            page.should have_content("'A Title one' was successfully removed.")
            Refinery::Categories::Download.count.should == 0
          end
        end

      end
    end
  end
end
