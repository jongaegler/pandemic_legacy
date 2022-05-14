class ApplicationRecord < ActiveRecord::Base
  AVAILABLE_COLORS = %i(red yellow blue black)
  primary_abstract_class
end
