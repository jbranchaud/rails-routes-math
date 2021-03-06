require 'rails_helper'

RSpec.describe "AdditionRoutes", :type => :request do

  it "should add the two values" do
    visit "/2/plus/2"
    expect(page).to have_content("4")
  end

  it "should add a positive and negative value" do
    visit "/2/plus/-2"
    expect(page).to have_content("0")
    visit "/-4/plus/2"
    expect(page).to have_content("-2")
  end

  it "should add two negative values" do
    visit "/-5/plus/-5"
    expect(page).to have_content("-10")
  end

  it "should render 400 Bad Request when a non-number value is given" do
    visit "/5/plus/a"
    expect(page.status_code).to eq(400)
    visit "/a/plus/5"
    expect(page.status_code).to eq(400)
  end

end
