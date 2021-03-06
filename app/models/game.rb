# frozen_string_literal: true

class Game < ApplicationRecord
  has_one_attached :banner

  enum genre: {
    game: 0,
    survey: 1
  }
end
