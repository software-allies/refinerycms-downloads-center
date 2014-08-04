require 'spec_helper'

module Refinery
  module Downloads
    describe Download do
      describe "validations" do
        subject do
          FactoryGirl.create(:download,
          :categoy => "Refinery CMS")
        end

        it { should be_valid }
        its(:errors) { should be_empty }
        its(:categoy) { should == "Refinery CMS" }
      end
    end
  end
end
