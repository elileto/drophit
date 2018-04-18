require 'test_helper'

class ProfileTest < ActiveSupport::TestCase


  
    def setup
      @user = User.create(firstname: "Example", lastname: "Example", email: "user@example.com",
        password: "foobaraa", password_confirmation: "foobaraa")
       @profile = Profile.create( user: @user, gender: :female, weight: 145, height: 67, date_of_birth: '1990-07-18')
      # @profile = profiles(:one)
       
      end


            
    test "testing validation" do
      #puts @profile.errors
     # assert_equal ["must be greater than or equal to 0"], @profile.errors[:gender]
     # assert @profile.errors[:gender].any?
     # assert @profile.errors[:weight].any?
     # assert @rofile.errors[:height].any?
     # assert @profile.errors[:date_of_birth].any?
      assert @profile.valid?

    end

    test "Profile attributes name must not be empty" do
      profile = Profile.new
      assert profile.invalid?
      assert profile.errors[:gender].any?
      assert profile.errors[:weight].any?
      assert profile.errors[:height].any?
      assert profile.errors[:date_of_birth].any?
    end 

     test "weight should be greater then or equal to zero" do
        @profile.weight  = -1
        assert @profile.invalid?
        assert @profile.errors[:weight].any?
        assert_equal ["must be greater than or equal to 0"], @profile.errors[:weight]

        @profile.weight  = 1
        assert @profile.valid?
     end

     test "height should be greater then or equal to zero" do
      @profile.height  = -1
      assert @profile.invalid?
      assert @profile.errors[:height].any?
      assert_equal ["must be greater than or equal to 0"], @profile.errors[:height]

      @profile.height  = 1
      assert @profile.valid?
     end
 
end
