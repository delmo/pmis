require 'spec_helper'

describe MonitorsController do

  describe "GET 'general'" do
    it "returns http success" do
      get 'general'
      response.should be_success
    end
  end

  describe "GET 'individual'" do
    it "returns http success" do
      get 'individual'
      response.should be_success
    end
  end

end
