require 'spec_helper'

describe "photos/show.html.haml" do
  before(:each) do
    @photo = assign(:photo, stub_model(Photo,
      :pet_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain(1.to_s)
  end
end
