require 'test_helper'

class ExerciseTest < ActiveSupport::TestCase
  def setup
    @exercise = Exercise.new(name: "exercise", sets: 3, repetitions: 5, hours: 1, minutes: 20, seconds: 45,
      weight: 120, intensityLevel: 3)
  end

  test "should be valid" do
    assert @exercise.valid?
  end

  
   
test "Profile attributes name must not be empty" do
  exercise = Exercise.new
  assert exercise.invalid?
  assert exercise.errors[:name].any?
end 


test "name should be present" do
  @exercise.name = " "
  assert @exercise.invalid?
  assert_equal ["can't be blank"], @exercise.errors[:name]
 end

 test "sets should be greater than or equal to zero" do
  @exercise.sets = -1
  assert @exercise.invalid?
  assert @exercise.errors[:sets].any?
  assert_equal ["must be greater than or equal to 0"], @exercise.errors[:sets]

  @exercise.sets = 0
  assert @exercise.valid?
  assert_not @exercise.errors[:repetitions].any?

  @exercise.sets = 1
  assert @exercise.valid?
  assert_not @exercise.errors[:sets].any?

end



test "repetitions should be greater than or equal to zero" do
  @exercise.repetitions = -1
  assert @exercise.invalid?
  assert @exercise.errors[:repetitions].any?
  assert_equal ["must be greater than or equal to 0"], @exercise.errors[:repetitions]
  
  @exercise.repetitions = 0
  assert @exercise.valid?
  assert_not @exercise.errors[:repetitions].any?

  @exercise.repetitions = 1
  assert @exercise.valid?
  assert_not @exercise.errors[:repetitions].any?
end

test "hours should be greater than or equal to zero" do
  @exercise.hours = -1
  assert @exercise.invalid?
  assert @exercise.errors[:hours].any?
  assert_equal ["must be greater than or equal to 0"], @exercise.errors[:hours]
  
  @exercise.hours = 0
  assert @exercise.valid?
  assert_not @exercise.errors[:hours].any?

  @exercise.hours = 1
  assert @exercise.valid?
  assert_not @exercise.errors[:hours].any?
end

test "minutes should be greater than or equal to zero" do
  @exercise.minutes = -1
  assert @exercise.invalid?
  assert @exercise.errors[:minutes].any?
  assert_equal ["must be greater than or equal to 0"], @exercise.errors[:minutes]
  
  @exercise.minutes = 0
  assert @exercise.valid?
  assert_not @exercise.errors[:minutes].any?

  @exercise.minutes = 1
  assert @exercise.valid?
  assert_not @exercise.errors[:minutes].any?
end

test "seconds should be greater than or equal to zero" do
  @exercise.seconds = -1
  assert @exercise.invalid?
  assert @exercise.errors[:seconds].any?
  assert_equal ["must be greater than or equal to 0"], @exercise.errors[:seconds]
  
  @exercise.seconds = 0
  assert @exercise.valid?
  assert_not @exercise.errors[:seconds].any?

  @exercise.seconds = 1
  assert @exercise.valid?
  assert_not @exercise.errors[:seconds].any?
end

test "minutes should be less then 60" do
  @exercise.minutes = 61
  assert @exercise.invalid?
  assert @exercise.errors[:minutes].any?
  assert_equal ["must be less than or equal to 59"], @exercise.errors[:minutes]
  
  @exercise.minutes = 60
  assert @exercise.invalid?
  assert @exercise.errors[:minutes].any?
  assert_equal ["must be less than or equal to 59"], @exercise.errors[:minutes]
  
  @exercise.minutes = 59
  assert @exercise.valid?
  assert_not @exercise.errors[:minutes].any?

end

test "seconds should be less then 60" do
  @exercise.seconds = 61
  assert @exercise.invalid?
  assert @exercise.errors[:seconds].any?
  assert_equal ["must be less than or equal to 59"], @exercise.errors[:seconds]
  
  @exercise.seconds = 60
  assert @exercise.invalid?
  assert @exercise.errors[:seconds].any?
  assert_equal ["must be less than or equal to 59"], @exercise.errors[:seconds]
  
  @exercise.seconds = 59
  assert @exercise.valid?
  assert_not @exercise.errors[:seconds].any?
end

test "weight should be greater than or equal to zero" do
  @exercise.weight = -1
  assert @exercise.invalid?
  assert @exercise.errors[:weight].any?
  assert_equal ["must be greater than or equal to 0"], @exercise.errors[:weight]
  
  @exercise.weight = 0
  assert @exercise.valid?
  assert_not @exercise.errors[:weight].any?

  @exercise.weight = 1
  assert @exercise.valid?
  assert_not @exercise.errors[:weight].any?
end




test "intensityLevel should be greater than or equal to one and less then or equal to five" do
  @exercise.intensityLevel = -1
  assert @exercise.invalid?
  assert @exercise.errors[:intensityLevel].any?
  assert_equal ["must be greater than or equal to 1"], @exercise.errors[:intensityLevel]
  
  @exercise.intensityLevel = 0
  assert @exercise.invalid?
  assert @exercise.errors[:intensityLevel].any?
  assert_equal ["must be greater than or equal to 1"], @exercise.errors[:intensityLevel]

  @exercise.intensityLevel = 1
  assert @exercise.valid?
  assert_not @exercise.errors[:intensityLevel].any?

  @exercise.intensityLevel = 6
  assert @exercise.invalid?
  assert @exercise.errors[:intensityLevel].any?
  assert_equal ["must be less than or equal to 5"], @exercise.errors[:intensityLevel]

  @exercise.intensityLevel = 5
  assert @exercise.valid?
  assert_not @exercise.errors[:intensityLevel].any?
end


end
