require 'rails_helper'

RSpec.describe "SubtractionRoutes", :type => :request do

  it "should subtract the two values" do
    visit "/3/minus/2"
    expect(page).to have_content("1")
    visit "/2/minus/3"
    expect(page).to have_content("-1")
  end

  it "should subtract positive and negative values" do
    visit "/-3/minus/2"
    expect(page).to have_content("-5")
    visit "/3/minus/-2"
    expect(page).to have_content("5")
  end

  it "should subtract two negative values" do
    visit "/-3/minus/-5"
    expect(page).to have_content("2")
    visit "/-5/minus/-1"
    expect(page).to have_content("-4")
  end

  it "should render a 400 Bad Request when a non-number value is given" do
    visit "/5/minus/hat"
    expect(page.status_code).to eq(400)
    visit "/bat/minus/3"
    expect(page.status_code).to eq(400)
  end

end
