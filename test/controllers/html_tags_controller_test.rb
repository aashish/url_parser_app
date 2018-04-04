require 'test_helper'

class HtmlTagsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @html_tag = html_tags(:one)
  end

  test "should get index" do
    get html_tags_url
    assert_response :success
  end

  test "should get new" do
    get new_html_tag_url
    assert_response :success
  end

  test "should create html_tag" do
    assert_difference('HtmlTag.count') do
      post html_tags_url, params: { html_tag: { name: @html_tag.name } }
    end

    assert_redirected_to html_tag_url(HtmlTag.last)
  end

  test "should show html_tag" do
    get html_tag_url(@html_tag)
    assert_response :success
  end

  test "should get edit" do
    get edit_html_tag_url(@html_tag)
    assert_response :success
  end

  test "should update html_tag" do
    patch html_tag_url(@html_tag), params: { html_tag: { name: @html_tag.name } }
    assert_redirected_to html_tag_url(@html_tag)
  end

  test "should destroy html_tag" do
    assert_difference('HtmlTag.count', -1) do
      delete html_tag_url(@html_tag)
    end

    assert_redirected_to html_tags_url
  end
end
