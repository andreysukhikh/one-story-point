require 'rails_helper'

RSpec.describe "authors/index", type: :view do
  before(:each) do
    assign(:authors, [
      Author.create!(
        fullname: "Fullname",
        book: nil
      ),
      Author.create!(
        fullname: "Fullname",
        book: nil
      )
    ])
  end

  it "renders a list of authors" do
    render
    assert_select "tr>td", text: "Fullname".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
