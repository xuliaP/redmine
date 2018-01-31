require File.expand_path('../../test_helper', __FILE__)

class ProductsControllerTest < ActionController::TestCase
  fixtures :products

  def test_index
    get :index

    assert_response :success
    assert_template 'index'
  end

  setup do
    @product = products(:one)
  end

  # called after every single test
  teardown do

    Rails.cache.clear
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end

  test "should update product" do
    patch :update, id: @product, product: { name: @product.name, issue_id: @product.issue_id, cost: @product.cost }
    assert_redirected_to products_path(assigns(:product))
  end

end

