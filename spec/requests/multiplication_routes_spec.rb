require 'rails_helper'

RSpec.describe "MultiplicationRoutes", :type => :request do
  
  it "should multiply the two values" do
    visit "/3/times/3"
    expect(page).to have_content("9")
  end

  it "should multiply a positive and negative value" do
    visit "/-3/times/5"
    expect(page).to have_content("-15")
    visit "/3/times/-5"
    expect(page).to have_content("-15")
  end

  it "should multiply two negative values" do
    visit "/-3/times/-4"
    expect(page).to have_content("12")
  end

  it "should render 400 Bad Request when a non-number value is given" do
    visit "/3/times/a"
    expect(page.status_code).to be(400)
    visit "/a/times/3"
    expect(page.status_code).to be(400)
  end

end
