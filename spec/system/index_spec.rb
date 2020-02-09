require "rails_helper"

RSpec.describe "StartPageSpecs", type: :system do
  before do
    driven_by(:selenium_chrome_headless)
  end

  it "shows a greeting" do
    visit "/"
    assert_text "Hello dumbasses"
  end

  it "shows the number of confirmed users" do
    visit "/"
    assert_selector "span.user_count", text: "0"
    create(:confirmed_user)
    create(:confirmed_user)
    visit "/"
    assert_selector "span.user_count", text: "2"
    User.last.update_column(:confirmed_at, nil)
    visit "/"
    assert_selector "span.user_count", text: "1"
  end
end
