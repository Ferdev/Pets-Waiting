require "spec_helper"

describe PetsController do
  describe "routing" do

        it "recognizes and generates #index" do
      { :get => "/pets" }.should route_to(:controller => "pets", :action => "index")
    end

        it "recognizes and generates #new" do
      { :get => "/pets/new" }.should route_to(:controller => "pets", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/pets/1" }.should route_to(:controller => "pets", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/pets/1/edit" }.should route_to(:controller => "pets", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/pets" }.should route_to(:controller => "pets", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/pets/1" }.should route_to(:controller => "pets", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/pets/1" }.should route_to(:controller => "pets", :action => "destroy", :id => "1")
    end

  end
end
