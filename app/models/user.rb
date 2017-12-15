class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  has_many :articles

  before_save {self.email = email.downcase}

  validates :username, presence: true, uniqueness: {case_sensitive: false},
                                       length: {minimum: 5, maximum: 24}
  validates :email, presence: true, length: {minimum: 6, maximum: 48},
                                    uniqueness: {case_sensitive: false},
                                    format: {with: VALID_EMAIL_REGEX}

end
