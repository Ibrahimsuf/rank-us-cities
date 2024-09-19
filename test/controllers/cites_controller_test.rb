require "test_helper"

class CitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cite = cites(:one)
  end

  test "should get index" do
    get cites_url
    assert_response :success
  end

  test "should get new" do
    get new_cite_url
    assert_response :success
  end

  test "should create cite" do
    assert_difference("Cite.count") do
      post cites_url, params: { cite: {  } }
    end

    assert_redirected_to cite_url(Cite.last)
  end

  test "should show cite" do
    get cite_url(@cite)
    assert_response :success
  end

  test "should get edit" do
    get edit_cite_url(@cite)
    assert_response :success
  end

  test "should update cite" do
    patch cite_url(@cite), params: { cite: {  } }
    assert_redirected_to cite_url(@cite)
  end

  test "should destroy cite" do
    assert_difference("Cite.count", -1) do
      delete cite_url(@cite)
    end

    assert_redirected_to cites_url
  end
end
