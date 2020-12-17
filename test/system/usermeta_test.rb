require "application_system_test_case"

class UsermetaTest < ApplicationSystemTestCase
  setup do
    @usermetum = usermeta(:one)
  end

  test "visiting the index" do
    visit usermeta_url
    assert_selector "h1", text: "Usermeta"
  end

  test "creating a Usermetum" do
    visit usermeta_url
    click_on "New Usermetum"

    fill_in "Email", with: @usermetum.email
    fill_in "Name", with: @usermetum.name
    fill_in "Usertype", with: @usermetum.usertype
    click_on "Create Usermetum"

    assert_text "Usermetum was successfully created"
    click_on "Back"
  end

  test "updating a Usermetum" do
    visit usermeta_url
    click_on "Edit", match: :first

    fill_in "Email", with: @usermetum.email
    fill_in "Name", with: @usermetum.name
    fill_in "Usertype", with: @usermetum.usertype
    click_on "Update Usermetum"

    assert_text "Usermetum was successfully updated"
    click_on "Back"
  end

  test "destroying a Usermetum" do
    visit usermeta_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Usermetum was successfully destroyed"
  end
end
