require 'spec_helper'

describe "pets/new.html.haml" do
  before(:each) do
    assign(:pet, stub_model(Pet,
      :new_record? => true
    ))
  end

  it "renders new pet form" do
    render

    rendered.should have_selector("form", :action => pets_path, :method => "post") do |form|
    end
  end
end
