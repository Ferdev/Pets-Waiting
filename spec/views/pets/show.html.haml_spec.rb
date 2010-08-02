require 'spec_helper'

describe "pets/show.html.haml" do
  before(:each) do
    @pet = assign(:pet, stub_model(Pet))
  end

  it "renders attributes in <p>" do
    render
  end
end
