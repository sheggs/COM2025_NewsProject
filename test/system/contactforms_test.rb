require "application_system_test_case"

class ContactformsTest < ApplicationSystemTestCase
  setup do
    @contactform = contactforms(:one)
  end

  test "visiting the index" do
    visit contactforms_url
    assert_selector "h1", text: "Contactforms"
  end

  test "creating a Contactform" do
    visit contactforms_url
    click_on "New Contactform"

    fill_in "Body", with: @contactform.body
    fill_in "Email", with: @contactform.email
    fill_in "Title", with: @contactform.title
    click_on "Create Contactform"

    assert_text "Contactform was successfully created"
    click_on "Back"
  end

  test "updating a Contactform" do
    visit contactforms_url
    click_on "Edit", match: :first

    fill_in "Body", with: @contactform.body
    fill_in "Email", with: @contactform.email
    fill_in "Title", with: @contactform.title
    click_on "Update Contactform"

    assert_text "Contactform was successfully updated"
    click_on "Back"
  end

  test "destroying a Contactform" do
    visit contactforms_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Contactform was successfully destroyed"
  end
end
