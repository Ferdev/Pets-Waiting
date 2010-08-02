require 'spec_helper'

describe "pets/index.html.haml" do
  before(:each) do
    assign(:pets, [
      stub_model(Pet),
      stub_model(Pet)
    ])
  end

  it "renders a list of pets" do
    render
  end
end
