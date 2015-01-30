require 'rails_helper'

RSpec.describe "AdditionRoutes", :type => :request do

  it "should add the two values" do
    visit "/2/plus/2"
    expect(page).to have_content("4")
  end

end
