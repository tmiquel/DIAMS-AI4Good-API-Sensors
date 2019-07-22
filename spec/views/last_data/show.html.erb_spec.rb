require 'rails_helper'

RSpec.describe "last_data/show", type: :view do
  before(:each) do
    @last_datum = assign(:last_datum, LastDatum.create!(
      :device => "device",
      :PM2_5 => "Pm2 5",
      :PM10 => "Pm10",
      :positive_feeling => 2,
      :mixed_feeling => 3,
      :negative_feeling => 4,
      :latitude => "Latitude",
      :longitude => "Longitude"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/device/)
    expect(rendered).to match(/Pm2 5/)
    expect(rendered).to match(/Pm10/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
    expect(rendered).to match(/Latitude/)
    expect(rendered).to match(/Longitude/)
  end
end
