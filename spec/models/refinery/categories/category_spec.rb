require 'spec_helper'

module Refinery
  module Categories
    describe Category do

      describe "validations" do
        subject do
          cat=FactoryGirl.create(:category, :title => "Refinery cat", :description => "Refinery desc")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:title) { should == "Refinery cat" }
        its(:description) { should == "Refinery desc" }
      end

    end
  end
end
