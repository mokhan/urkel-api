require "spec_helper"

describe User do
  context "#save" do
    it "can be saved" do
      User.create!(email: 'mo@mokhan.ca')
      User.count.should == 1
    end
  end
end
