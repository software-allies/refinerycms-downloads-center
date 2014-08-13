# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Categories" do
    describe "Admin" do
      describe "subcategories" do
        login_refinery_user

        describe "subcategories list" do
          before do
            FactoryGirl.create(:subcategory, :title => "UniqueTitleOne")
            FactoryGirl.create(:subcategory, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.categories_admin_subcategories_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.categories_admin_subcategories_path

            click_link "Add New Subcategory"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Categories::Subcategory.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Title can't be blank")
              Refinery::Categories::Subcategory.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:subcategory, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.categories_admin_subcategories_path

              click_link "Add New Subcategory"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Categories::Subcategory.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:subcategory, :title => "A title") }

          it "should succeed" do
            visit refinery.categories_admin_subcategories_path

            within ".actions" do
              click_link "Edit this subcategory"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            page.should have_content("'A different title' was successfully updated.")
            page.should have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:subcategory, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.categories_admin_subcategories_path

            click_link "Remove this subcategory forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Categories::Subcategory.count.should == 0
          end
        end

      end
    end
  end
end
