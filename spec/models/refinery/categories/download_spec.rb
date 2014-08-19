require 'spec_helper'

module Refinery
  module Categories
    describe Download do

      describe "validations" do
        subject do
          cat=FactoryGirl.create(:category, :title => "Refinery cat", :description => "Refinery desc")
          subcat=FactoryGirl.create(:subcategory, :title => "Refinery subcat", :description => "Refinery desc", :category_id=>cat.id)
          FactoryGirl.create(:download, :title => "Refinery CMS", :subcategory_id => subcat.id)
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:title) { should == "Refinery CMS" }
      end

      describe "relationships" do
        before do
          cat=FactoryGirl.create(:category, :title => "Refinery cat", :description => "Refinery desc")
          subcat=FactoryGirl.create(:subcategory, :title => "Refinery subcat", :description => "Refinery desc", :category_id=>cat.id)
          FactoryGirl.create(:download, :title => "Refinery download", :description => "Refinery desc", :subcategory_id=>subcat.id)
        end

        it "should has a subcat with a download" do 
          cat = Category.first
          subcat = cat.subcategories.first
          download = subcat.downloads.first
          download.should be_present
        end
      end


    end
  end
end
