require 'rails_helper'

RSpec.describe "authors/new", type: :view do
  before(:each) do
    assign(:author, Author.new(
      fullname: "MyString",
      book: nil
    ))
  end

  it "renders new author form" do
    render

    assert_select "form[action=?][method=?]", authors_path, "post" do

      assert_select "input[name=?]", "author[fullname]"

      assert_select "input[name=?]", "author[book_id]"
    end
  end
end
