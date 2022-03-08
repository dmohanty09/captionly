require "application_system_test_case"

class CaptionsTest < ApplicationSystemTestCase
  setup do
    @caption = captions(:one)
  end

  test "visiting the index" do
    visit captions_url
    assert_selector "h1", text: "Captions"
  end

  test "should create caption" do
    visit captions_url
    click_on "New caption"

    fill_in "Text", with: @caption.text
    fill_in "Timestamp", with: @caption.timestamp
    fill_in "Video", with: @caption.video_id
    click_on "Create Caption"

    assert_text "Caption was successfully created"
    click_on "Back"
  end

  test "should update Caption" do
    visit caption_url(@caption)
    click_on "Edit this caption", match: :first

    fill_in "Text", with: @caption.text
    fill_in "Timestamp", with: @caption.timestamp
    fill_in "Video", with: @caption.video_id
    click_on "Update Caption"

    assert_text "Caption was successfully updated"
    click_on "Back"
  end

  test "should destroy Caption" do
    visit caption_url(@caption)
    click_on "Destroy this caption", match: :first

    assert_text "Caption was successfully destroyed"
  end
end
