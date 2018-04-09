require 'test_helper'

class WorkoutTest < ActiveSupport::TestCase

    def setup
        @workout = Workout.new(name: "Workout Name", method: 1, featureImage: "image.jpg")
      end


    test "should be valid" do
        assert_not @workout.valid?
      end

    test "name should be present" do
        @workout.name = " "
        assert_not @workout.valid?
     end


 end
