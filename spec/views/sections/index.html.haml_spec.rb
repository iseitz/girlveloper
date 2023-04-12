require 'rails_helper'

RSpec.describe "sections/index", type: :view do
  before(:each) do
    assign(:sections, [
      Section.create!(
        title: "Title",
        overview: "MyText",
        course: nil
      ),
      Section.create!(
        title: "Title",
        overview: "MyText",
        course: nil
      )
    ])
  end

  it "renders a list of sections" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
