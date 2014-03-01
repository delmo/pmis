require 'spec_helper'

describe InLine do

 it "has a valid title, description and justification" do
  expect(FactoryGirl.build(:in_line)).to be_valid
 end

 it "is invalid without a title" do
  in_line = FactoryGirl.build(:in_line, title: nil)
  expect(in_line).to have(1).errors_on(:title)
 end

 it "is invalid without a description" do
  in_line = build(:in_line, description: nil)
  expect(in_line).to have(1).errors_on(:description)
 end

 it "is invalid without a justification" do
  expect(build(:in_line, justification: nil)).to \
   have(1).errors_on(:justification)
 end

end
