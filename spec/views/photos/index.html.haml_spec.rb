require 'spec_helper'

describe "photos/index.html.haml" do
  before(:each) do
    assign(:photos, [
      stub_model(Photo,
        :pet_id => 1
      ),
      stub_model(Photo,
        :pet_id => 1
      )
    ])
  end

  it "renders a list of photos" do
    render
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
  end
end
