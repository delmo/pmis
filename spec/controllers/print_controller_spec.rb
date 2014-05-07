require 'spec_helper'

describe PrintController do

  describe "GET 'api'" do
    it "returns http success" do
      get 'api'
      response.should be_success
    end
  end

  describe "GET 'accomplishment'" do
    it "returns http success" do
      get 'accomplishment'
      response.should be_success
    end
  end

end
