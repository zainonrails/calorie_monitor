class Eating < ApplicationRecord
  belongs_to :intake, inverse_of: :eatings
  belongs_to :eatable, polymorphic: true
end
