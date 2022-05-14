class Disease < ApplicationRecord
  MAX_CUBES = 24

  # Convenience accessors Disease.red
  AVAILABLE_COLORS.each do |color|
    define_singleton_method(color) { find_by(color: color) }
  end

  def self.reset_to_default
    all.update_all(cured: false, eradicated: false, cubes_left: MAX_CUBES)
  end
end
