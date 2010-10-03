# encoding: UTF-8
require File.dirname(__FILE__) + "/../../spec_helper"

describe "rake" do

  describe "db:seed" do
    
    it "should seed database without repeat data if runs twice" do
      Animal.count.should eq(0)
      Breed.count.should eq(0)
      Disease.count.should eq(0)
      Sex.count.should eq(0)
      Size.count.should eq(0)
      `rake db:seed`
      `rake db:seed`
      Animal.count.should eq(6)
      Breed.count.should eq(121)
      Disease.count.should eq(5)
      Sex.count.should eq(2)
      Size.count.should eq(5)
    end
  end
end