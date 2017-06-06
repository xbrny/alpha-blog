require 'test_helper'
class CreateCategoriesTest < ActionDispatch::IntegrationTest

  def setup
    @user = User.create(username: "John", email: "john@example.com", password: "password", admin: true)
  end

  test "get new category from form and create category" do
    post login_path, session: {email: @user.email, password: @user.password}
    get new_category_path
    assert_template "categories/new"
    assert_difference "Category.count", 1 do
      post_via_redirect categories_path, category: {name: "sports"}
    end
    assert_template "categories/index"
    assert_match "sports", response.body
  end

  test "invalid category submission and result in failure" do
    post login_path, session: {email: @user.email, password: @user.password}
    get new_category_path
    assert_template "categories/new"
    assert_no_difference "Category.count" do
      post categories_path, category: {name: " "}
    end
    assert_template "categories/new"
    assert_select "div.panel-body"
    assert_select "h2.panel-title"
  end
end
