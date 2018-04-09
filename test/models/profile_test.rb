require 'test_helper'

class ProfileTest < ActiveSupport::TestCase
    def setup
        @profile = Profile.new(gender: 1, weight: 2, height: 3,
        date_of_birth: 1990-07-18)
      end

    test "should be valid" do
        assert_not @profile.valid?
      end

    test "gender should be present" do
        @profile.gender = " "
        assert_not @profile.valid?
     end

     test "weight should be present" do
        @profile.weight = " "
        assert_not @profile.valid?
     end

     test "height should be present" do
        @profile.height = " "
        assert_not @profile.valid?
     end

      test "date of birth should be present" do
        @profile.date_of_birth =  " "
        assert_not @profile.valid?
     end

     test "height should be greater then zero" do
        @profile.height < 0
        assert_not @profile.valid?
     end

     test "weight should be greater then zero" do
        @profile.weight < 0
        assert_not @profile.valid?
     end

     test "gender should be a number" do
        !(@profile.gender.is_a? Integer) 
        assert_not @profile.valid?
     end

     test "weight should be a number" do
        !(@profile.weight.is_a? Integer) 
        assert_not @profile.valid?
     end

   

   
end
