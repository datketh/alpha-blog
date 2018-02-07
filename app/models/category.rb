class Category < ActiveRecord::Base
  validates :name, presence: true, length: {minimum: 6, maximum: 25}
  validates_uniqueness_of :name
end
