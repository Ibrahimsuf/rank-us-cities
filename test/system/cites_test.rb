require "application_system_test_case"

class CitesTest < ApplicationSystemTestCase
  setup do
    @cite = cites(:one)
  end

  test "visiting the index" do
    visit cites_url
    assert_selector "h1", text: "Cites"
  end

  test "should create cite" do
    visit cites_url
    click_on "New cite"

    click_on "Create Cite"

    assert_text "Cite was successfully created"
    click_on "Back"
  end

  test "should update Cite" do
    visit cite_url(@cite)
    click_on "Edit this cite", match: :first

    click_on "Update Cite"

    assert_text "Cite was successfully updated"
    click_on "Back"
  end

  test "should destroy Cite" do
    visit cite_url(@cite)
    click_on "Destroy this cite", match: :first

    assert_text "Cite was successfully destroyed"
  end
end
