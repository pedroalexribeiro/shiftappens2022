# frozen_string_literal: true

class Event < ApplicationRecord
  include Filterable

  # Organization reference
  belongs_to :organization

  # Donations relations
  has_many :donations, dependent: :destroy
  has_many :donators, class_name: 'Donor', through: :donations, source: :donor

  # Scope for better searches
  scope :local, includes(:organization).where('races.prizes=?', 'medals')
  scope :global, -> { where(nil).order(created_at: :desc) }
end
