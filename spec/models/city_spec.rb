require 'spec_helper'

describe City do

 it "has all valid parameters" do
  expect(build(:city)).to be_valid
 end
end
