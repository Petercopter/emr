class Facility < ApplicationRecord
  has_many :patients, inverse_of: :facility

  validates :name, presence: true, uniqueness: { case_sensitive: false }
end
