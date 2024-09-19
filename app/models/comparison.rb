class Comparison < ApplicationRecord
  belongs_to :winner, class_name: 'City'
  belongs_to :loser, class_name: 'City'
end
