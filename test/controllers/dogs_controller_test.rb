require "test_helper"

class DogsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_dog_url
    assert_response :success
    assert_select "form"
  end

  test "should get index" do
    get dogs_url
    assert_response :success
  end

  test "should get show" do
    dog = Dog.create!(name: "Rex", breed: "Labrador", user: User.first_or_create!(email: "user@example.com"))

    get dog_url(dog)
    assert_response :success
  end
end
