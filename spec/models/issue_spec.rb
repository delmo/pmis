require 'spec_helper'

describe Issue do

 it "is valid with title, implication, intervention" do
  issue = Issue.new(
   title: "Flood in the marketplace",
   implication: "Difficult to conduct business and attract buyers and investors.",
   intervention: "Recovery and cleaning of dranage system.")
  expect(issue).to be_valid
 end

 it "is invalid without a title" do
  expect(Issue.new(title: nil)).to have(1).errors_on(:title)
 end

 it "is invalid without an implication" do
  issue = Issue.new(
   title: "Flood in the marketplace",
   implication: nil,
   intervention: "Recovery and improvement of drainage system.")
  expect(issue).to be_invalid
 end

 it "is invalid without an intervention" do
  issue = Issue.new(
   title: "Flood in the marketplace",
   implication: "Difficult to conduct business and attract buyers and investors.",
   intervention: nil)
  expect(issue).to be_invalid
 end

end

