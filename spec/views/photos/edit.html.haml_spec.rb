require 'spec_helper'

describe "photos/edit.html.haml" do
  before(:each) do
    @photo = assign(:photo, stub_model(Photo,
      :new_record? => false,
      :pet_id => 1
    ))
  end

  it "renders the edit photo form" do
    render

    rendered.should have_selector("form", :action => photo_path(@photo), :method => "post") do |form|
      form.should have_selector("input#photo_pet_id", :name => "photo[pet_id]")
    end
  end
end
