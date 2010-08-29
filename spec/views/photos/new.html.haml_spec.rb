require 'spec_helper'

describe "photos/new.html.haml" do
  before(:each) do
    assign(:photo, stub_model(Photo,
      :new_record? => true,
      :pet_id => 1
    ))
  end

  it "renders new photo form" do
    render

    rendered.should have_selector("form", :action => photos_path, :method => "post") do |form|
      form.should have_selector("input#photo_pet_id", :name => "photo[pet_id]")
    end
  end
end
