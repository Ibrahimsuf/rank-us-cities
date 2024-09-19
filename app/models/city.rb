class City < ApplicationRecord
  has_many :comparison_as_city1, class_name: 'Comparison', foreign_key: 'city1_id'
  has_many :comparison_as_city2, class_name: 'Comparison', foreign_key: 'city2_id'

  K = 16

  def expected_win_prob(other_city)
    1.0 / (1.0 + 10.0 ** ((other_city.elo - self.elo) / 400.0))
  end
  def update_elo(expected_score, actual_score)
    self.elo + K * (actual_score - expected_score)
  end

  def win(other_city)
    wins = self.wins + 1
    expected_score = expected_win_prob(other_city)
    actual_score = 0
    new_elo = update_elo(expected_score, actual_score)
    self.update(wins: wins, elo: new_elo)
  end
  def loss(other_city)
    loses = self.loses + 1
    expected_score = expected_win_prob(other_city)
    actual_score = 0
    new_elo = update_elo(expected_score, actual_score)
    self.update(loses: loses, elo: new_elo)
  end
  

  def self.order_by_elo
    rated_cities = City.where("wins > 0 OR loses > 0").order(elo: :desc)
    unrated_cities = City.where("wins = 0 AND loses = 0")
    rated_cities + unrated_cities
  end
  def image_name
    "cities/" + self.name.split(", ").first.tr(" ", "_") + ".jpg"
  end
end
