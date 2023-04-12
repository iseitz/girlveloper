require 'rails_helper'

RSpec.describe "sections/new", type: :view do
  before(:each) do
    assign(:section, Section.new(
      title: "MyString",
      overview: "MyText",
      course: nil
    ))
  end

  it "renders new section form" do
    render

    assert_select "form[action=?][method=?]", sections_path, "post" do

      assert_select "input[name=?]", "section[title]"

      assert_select "textarea[name=?]", "section[overview]"

      assert_select "input[name=?]", "section[course_id]"
    end
  end
end
