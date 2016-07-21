require "spec_helper"

describe "Creating a secret with the new secret form" do
  it "saves the secret" do
    visit "/"
    click_link "New Secret"
    fill_in "secret_text", with: "Soviet paratroopers!"
    click_button "Create Secret"
    expect(page).to have_content("Soviet paratroopers!")
  end
end
