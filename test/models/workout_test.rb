require 'test_helper'

class WorkoutTest < ActiveSupport::TestCase

    def setup
        @workout = Workout.new(name: "Workout Name", method: "Yoga", featureImage: "image.jpg")
      end

      test "workout must be valid" do
        assert @workout.valid?
      end
      test "Workout attributes must not be empty" do
        workout = Workout.new
        assert workout.invalid?
        assert workout.errors[:name].any?
      end 

      # is this what I should be testing or should I be testing integers, it doesnt seem to work with integers
    
    
      test "Method should be greater then or equal to zero" do

        methods = [:Other, :Yoga, :Hiit, :Cardio, :Strength, :Aerobic]
        methods.each do |valid_method|
            @workout.method = valid_method
            assert @workout.valid?, "#{valid_method.inspect} should be valid"
        end

     end

 end
