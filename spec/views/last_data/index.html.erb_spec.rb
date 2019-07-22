require 'rails_helper'

RSpec.describe "last_data/index", type: :view do
  before(:each) do
    assign(:last_data, [
      LastDatum.create!(
        :device => "device",
        :PM2_5 => "Pm2 5",
        :PM10 => "Pm10",
        :positive_feeling => 2,
        :mixed_feeling => 3,
        :negative_feeling => 4,
        :latitude => "Latitude",
        :longitude => "Longitude"
      ),
      LastDatum.create!(
        :device => "device",
        :PM2_5 => "Pm2 5",
        :PM10 => "Pm10",
        :positive_feeling => 2,
        :mixed_feeling => 3,
        :negative_feeling => 4,
        :latitude => "Latitude",
        :longitude => "Longitude"
      )
    ])
  end

  it "renders a list of last_data" do
    render
    assert_select "tr>td", :text => "device".to_s, :count => 2
    assert_select "tr>td", :text => "Pm2 5".to_s, :count => 2
    assert_select "tr>td", :text => "Pm10".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
    assert_select "tr>td", :text => "Latitude".to_s, :count => 2
    assert_select "tr>td", :text => "Longitude".to_s, :count => 2
  end
end
