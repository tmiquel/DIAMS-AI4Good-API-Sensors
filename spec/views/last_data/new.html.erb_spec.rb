require 'rails_helper'

RSpec.describe "last_data/new", type: :view do
  before(:each) do
    assign(:last_datum, LastDatum.new(
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

  it "renders new last_datum form" do
    render

    assert_select "form[action=?][method=?]", last_data_path, "post" do

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
