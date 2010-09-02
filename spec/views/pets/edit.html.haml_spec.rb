require 'spec_helper'

describe "pets/edit.html.haml" do
  before(:each) do
    @pet = assign(:pet, stub_model(Pet,
      :new_record? => false
    ))
  end

  it "renders the edit pet form" do
    render

    rendered.should have_selector("form", :action => pet_path(@pet), :method => "post") do |form|
    end
  end
end
