# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Categories" do
    describe "Admin" do
      describe "downloads" do
        login_refinery_user

        describe "downloads list" do
          before do
            FactoryGirl.create(:download, :title => "UniqueTitleOne")
            FactoryGirl.create(:download, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.categories_admin_downloads_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.categories_admin_downloads_path

            click_link "Add New Download"
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
            before { FactoryGirl.create(:download, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.categories_admin_downloads_path

              click_link "Add New Download"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Categories::Download.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:download, :title => "A title") }

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
          before { FactoryGirl.create(:download, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.categories_admin_downloads_path

            click_link "Remove this download forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Categories::Download.count.should == 0
          end
        end

      end
    end
  end
end
