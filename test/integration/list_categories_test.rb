require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @category1 = Category.create(name: "sports")
    @category_2 = Category.create(name: "work")
  end

  test "should show categories index" do
    get categories_path
    assert_template 'categories/index'
    assert_select "a[href=?]", category_path(@category1), text: @category1.name
    #assert_select "a[href=?]", category_path(@category_2), text: @category_2.name
  end
end
