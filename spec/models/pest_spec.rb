require "spec_helper"

describe Pest do

 describe "validation" do
  before :each do
   @pest1 = Pest.new(title: "Technologically feasible",
                     description: "Techological description of the PPA.",
                     justification: "Tech support is available. All resources are available.")
   @pest2 = Pest.new(title: nil,
                     description: "Techological description of the PPA.",
                     justification: "Tech support is available. All resources are available.")
   @pest3 = Pest.new(title: "Technologically feasible",
                     description: nil,
                     justification: nil)
  end

  context "valid PEST" do
   it "because is has a title, description and justification" do
    expect(@pest1).to be_valid
   end
  end

  context "invalid PEST" do
   it "because title is nil" do
    expect(@pest2).to be_invalid
   end

   it "because no description and justification" do
    expect(@pest3).to have(1).errors_on(:description)
   end
  end

 end
end

