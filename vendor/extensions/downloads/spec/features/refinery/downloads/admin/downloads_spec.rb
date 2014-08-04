# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Downloads" do
    describe "Admin" do
      describe "downloads" do
        refinery_login_with :refinery_user

        describe "downloads list" do
          before do
            FactoryGirl.create(:download, :categoy => "UniqueTitleOne")
            FactoryGirl.create(:download, :categoy => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.downloads_admin_downloads_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.downloads_admin_downloads_path

            click_link "Add New Download"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Categoy", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Downloads::Download.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Categoy can't be blank")
              Refinery::Downloads::Download.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:download, :categoy => "UniqueTitle") }

            it "should fail" do
              visit refinery.downloads_admin_downloads_path

              click_link "Add New Download"

              fill_in "Categoy", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Downloads::Download.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:download, :categoy => "A categoy") }

          it "should succeed" do
            visit refinery.downloads_admin_downloads_path

            within ".actions" do
              click_link "Edit this download"
            end

            fill_in "Categoy", :with => "A different categoy"
            click_button "Save"

            page.should have_content("'A different categoy' was successfully updated.")
            page.should have_no_content("A categoy")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:download, :categoy => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.downloads_admin_downloads_path

            click_link "Remove this download forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Downloads::Download.count.should == 0
          end
        end

      end
    end
  end
end
