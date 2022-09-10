require 'rails_helper'

RSpec.describe "authors/show", type: :view do
  before(:each) do
    @author = assign(:author, Author.create!(
      fullname: "Fullname",
      book: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Fullname/)
    expect(rendered).to match(//)
  end
end
