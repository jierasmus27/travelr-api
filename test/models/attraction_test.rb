require 'test_helper'

class AttractionTest < ActiveSupport::TestCase
  setup do
    @attraction = attractions(:castle_of_good_hope)
  end

  test 'the name has to be present' do
    new_attraction = Attraction.new

    refute_predicate new_attraction, :valid?
    assert_includes new_attraction.errors.full_messages, "Name can't be blank"
  end

  test 'the name has to be unique' do
    new_attraction = Attraction.new
    new_attraction.name = @attraction.name

    refute_predicate new_attraction, :valid?
    assert_includes new_attraction.errors.full_messages, 'Name has already been taken'
  end
end
