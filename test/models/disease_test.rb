require "test_helper"

class DiseaseTest < ActiveSupport::TestCase
  Disease::AVAILABLE_COLORS.each do |color|
    test 'dynamic accessors' do
      assert_equal(Disease.send(color).color, color)
    end
  end
end
