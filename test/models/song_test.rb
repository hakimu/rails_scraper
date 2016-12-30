require 'test_helper'

class SongTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should work" do
    foo = Song.all
    assert foo.class, foo.reverse
  end
end
