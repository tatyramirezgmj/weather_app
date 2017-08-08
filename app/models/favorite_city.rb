class FavoriteCity < ApplicationRecord
  belongs_to :user
  geocoded_by :city_name do |object, results|
    if results.present?
      object.latitude = results.first.latitude
      object.longitude = results.first.longitude
    else
      object.latitude = nil
      object.longitude = nil
    end
  end
  validates :city_name, presence: true
  validate :address_presence_and_founded
  before_validation :geocode
  def address_presence_and_founded
    if latitude.blank? || longitude.blank?
      errors.add(:city_name, "We couldn't find the city you are looking for")
      end
    end
  end
