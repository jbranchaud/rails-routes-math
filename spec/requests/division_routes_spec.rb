require 'rails_helper'

RSpec.describe "DivisionRoutes", :type => :request do

  it "should divide the two values" do
    visit "/3/by/3"
    expect(page).to have_content("1")
  end

  it "should divide a positive and negative value" do
    visit "/4/by/-2"
    expect(page).to have_content("-2")
    visit "/-4/by/2"
    expect(page).to have_content("-2")
  end

  it "should divide two negative values" do
    visit "/-10/by/-2"
    expect(page).to have_content("5")
  end

  it "should divide non-evenly-divisible values and round the result" do
    visit "/5/by/2"
    expect(page).to have_content("2")
  end

  it "should render a 400 Bad Request when the second value is zero" do
    visit "/4/by/0"
    expect(page.status_code).to eq(400)
  end

  it "should render a 400 Bad Request when a non-number value is given" do
    visit "/4/by/a"
    expect(page.status_code).to eq(400)
    visit "/a/by/4"
    expect(page.status_code).to eq(400)
  end

end
