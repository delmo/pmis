require 'spec_helper'

describe Department do

 it "is invalid with a duplicate department's name" do
  Department.create(sector_id: 1,
                    name: "ICT",
                    description: "Bunch of geeks",
                    telephone: "043-284-4444",
                    email: "ict@example.com")
  department = Department.new(sector_id: 1,
                    name: "ICT",
                    description: "Bunch of geeks",
                    telephone: "043-284-4444",
                    email: "ict@example.com")
  expect(department).to have(1).errors_on(:name)
 end

 it "allows two departments to share a telephone number" do
  Department.create(sector_id: 1,
                    name: "ICT",
                    description: "Bunch of geeks",
                    telephone: "043-284-4444",
                    email: "ict@example.com")
  department = Department.new(sector_id: 1,
                    name: "Motorpool",
                    description: "Bunch of engineers",
                    telephone: "043-284-4444",
                    email: "engr@example.com")
  expect(department).to be_valid
 end


end
