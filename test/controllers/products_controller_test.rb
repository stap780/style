require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post :create, product: { category: @product.category, collection: @product.collection, complect: @product.complect, foto: @product.foto, gruppa: @product.gruppa, metalcolor: @product.metalcolor, price: @product.price, proba: @product.proba, quantity: @product.quantity, shortdesc: @product.shortdesc, size: @product.size, sku: @product.sku, title: @product.title, vstavka: @product.vstavka, weight: @product.weight }
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    patch :update, id: @product, product: { category: @product.category, collection: @product.collection, complect: @product.complect, foto: @product.foto, gruppa: @product.gruppa, metalcolor: @product.metalcolor, price: @product.price, proba: @product.proba, quantity: @product.quantity, shortdesc: @product.shortdesc, size: @product.size, sku: @product.sku, title: @product.title, vstavka: @product.vstavka, weight: @product.weight }
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
