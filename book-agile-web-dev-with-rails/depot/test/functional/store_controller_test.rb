require 'test_helper'

class StoreControllerTest < ActionController::TestCase
  test "should get index" do

    # all of this stuff will be tested with the data from our fixtures

    get :index
    assert_response :success
    assert_select '#columns #side a', minimum: 4 # minimum of 4 links
    assert_select '#main .entry', 3 # exactly 3 elements with .entry class
    assert_select 'h3', 'Programming Ruby 1.9' # a h3 exists with contents given
    assert_select '.price', /\$[,\d]+\.\d\d/ # the contents of the .price element matches the regexp

    # so assert_select can understand HTML - does it use nokogiri?

    # both validation (in the model) and functional tests will test the
    # behaviour of controllers only. They will not retroactively affect any
    # objects already in the database or in the fixtures

    # I can ad
  end

end
