require 'test_helper'

# this file holds the unit tests for the Product model
# For model Foo this file is /test/unit/foo_test.rb
# class name is FooTest and it inherits from ActiveSupport::TestCase
class ProductTest < ActiveSupport::TestCase

  # Load fixture data corresponding with the given model into the corresponding
  # table name in the test DB before *each* test method is run.
  fixtures :products

  # test "the truth" do
  #   assert true
  # end

  test "product attributes must not be empty" do
    # Create a new empty product
    product = Product.new

    # assert just check that it's argument is true
    # We would expect all  the fields to have errors
    assert product.invalid?
    assert product.errors[:title].any?
    assert product.errors[:description].any?
    assert product.errors[:price].any?
    assert product.errors[:image_url].any?
  end

  test "product price must be positive" do
    product = Product.new(  title:        "My Book Title",
                            description:  "blah",
                            image_url:    'xxx.jpg')
    product.price = -1
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.price = 0
    assert product.invalid?
    assert_equal ["must be greater than or equal to 0.01"], product.errors[:price]

    product.price = 1
    assert product.valid?
  end

  def new_product(image_url)
    Product.new(  title:        "My Book Title",
                  description:  "blah",
                  price:        1,
                  image_url:    image_url)
  end

  test "image url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }

    ok.each do |name|
      assert new_product(name).valid?, "#{name} shouldn't be invalid"
    end

    bad.each do |name|
      assert new_product(name).invalid?, "#{name} shouldn't be valid"
    end
  end


  test "product is not valid without a unique title - i18n" do
    # ? dump whole db to console now
    product = Product.new(  title: products(:ruby).title,
      description: "yyy",
      price: 1,
      image_url: 'fred.gif')
    assert product.invalid?
    assert_equal [I18n.translate('activerecord.errors.messages.taken')], product.errors[:title]

  end
end