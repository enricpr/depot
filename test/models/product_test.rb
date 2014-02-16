require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  fixtures :products
  
  test "product attr must not be empty" do
    product = Product.new
	assert product.invalid?
	assert product.errors[:title].any?
	assert product.errors[:description].any?
	assert product.errors[:price].any?
	assert product.errors[:image_url].any?
  end
  
  test "price must be >0" do
    product = Product.new(title: "Item title", description: "asdasd", image_url: "asdasd.jpg")
	product.price = -1
	assert product.invalid?
	assert_equal [">0"], product.errors[:price]
	
	product.price = 0
	assert product.invalid?
	assert_equal [">0"], product.errors[:price]
	
	product.price = 1
	assert product.valid?
  end
  
  def new_product(image_url)
    Product.new(title: "My item title", description: "sadasd", price: 1, image_url: image_url)
  end
  
  test "image url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg http://a.b.c/x/y/z/fred.gif }
	ko = %w{ fred.doc fred.gif/more fred.gif.more }
	ok.each do |name|
	  assert new_product(name).valid?, "#{name} should be valid"
    end
	ko.each do |name|
	  assert new_product(name).invalid?, "#{name} shouldn't be valid"
	end
  end
  
  test "product must have a unique title" do
    product = Product.new(title: products(:ruby).title,
							description: "adasd",
							price: 1,
							image_url: "rubmy.gif")
	assert product.invalid?
	assert_equal ["has already been taken"], product.errors[:title]
  end
  
end
