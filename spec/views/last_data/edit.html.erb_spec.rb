require 'rails_helper'

RSpec.describe "last_data/edit", type: :view do
  before(:each) do
    @last_datum = assign(:last_datum, LastDatum.create!(
      :devise => "MyString",
      :PM2_5 => "MyString",
      :PM10 => "MyString",
      :positive_feeling => 1,
      :mixed_feeling => 1,
      :negative_feeling => 1,
      :latitude => "MyString",
      :longitude => "MyString"
    ))
  end

  it "renders the edit last_datum form" do
    render

    assert_select "form[action=?][method=?]", last_datum_path(@last_datum), "post" do

      assert_select "input[name=?]", "last_datum[devise]"

      assert_select "input[name=?]", "last_datum[PM2_5]"

      assert_select "input[name=?]", "last_datum[PM10]"

      assert_select "input[name=?]", "last_datum[positive_feeling]"

      assert_select "input[name=?]", "last_datum[mixed_feeling]"

      assert_select "input[name=?]", "last_datum[negative_feeling]"

      assert_select "input[name=?]", "last_datum[latitude]"

      assert_select "input[name=?]", "last_datum[longitude]"
    end
  end
end
