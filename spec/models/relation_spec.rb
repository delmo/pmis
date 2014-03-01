require 'spec_helper'

describe Relation do

 it "has a valid title, description and justification" do
  expect(build(:relation)).to be_valid
 end

=begin
 it "is invalid without a title" do
  expect(build(:relation, title: :invalid_relation)).to \
   have(1).errors_on(:title)
 end
=end

end
