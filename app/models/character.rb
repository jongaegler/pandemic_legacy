class Character < ApplicationRecord
  CHARACTERS = %w(dispatcher generalist medic scientist researcher)
  CHARACTERS.each do |character|
    define_method("#{character}?") do
      name == character
    end
  end
end
