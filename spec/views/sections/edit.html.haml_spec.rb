require 'rails_helper'

RSpec.describe "sections/edit", type: :view do
  before(:each) do
    @section = assign(:section, Section.create!(
      title: "MyString",
      overview: "MyText",
      course: nil
    ))
  end

  it "renders the edit section form" do
    render

    assert_select "form[action=?][method=?]", section_path(@section), "post" do

      assert_select "input[name=?]", "section[title]"

      assert_select "textarea[name=?]", "section[overview]"

      assert_select "input[name=?]", "section[course_id]"
    end
  end
end
