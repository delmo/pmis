require 'spec_helper'

describe SelectionsController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'general'" do
    it "returns http success" do
      get 'general'
      response.should be_success
    end
  end

  describe "GET 'social'" do
    it "returns http success" do
      get 'social'
      response.should be_success
    end
  end

  describe "GET 'economic'" do
    it "returns http success" do
      get 'economic'
      response.should be_success
    end
  end

  describe "GET 'other'" do
    it "returns http success" do
      get 'other'
      response.should be_success
    end
  end

end
