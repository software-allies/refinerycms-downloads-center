require 'spec_helper'

module Refinery
  module Categories
    describe Subcategory do
      describe "validations" do
        subject do
          cat=FactoryGirl.create(:category, :title => "Refinery cat", :description => "Refinery desc")
          FactoryGirl.create(:subcategory, :title => "Refinery CMS", :category_id=>cat.id)
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:title) { should == "Refinery CMS" }
      end

      describe "relationships" do
        before do
          cat=FactoryGirl.create(:category, :title => "Refinery cat", :description => "Refinery desc")
          subcat=FactoryGirl.create(:subcategory, :title => "Refinery subcat", :description => "Refinery desc", :category_id=>cat.id)
        end

        it "should has a subcat with a download" do 
          cat = Category.first
          subcat = cat.subcategories.first
          subcat.category.should be_present
        end
      end


    end
  end
end
