#require 'bcrypt'

class User < ApplicationRecord
  has_many :posts, dependent: :destroy

  before_save { self.email = email.downcase if email.present? }
  before_save { self.role ||= :member }

  validates :name, length: { minimum: 1, maximum: 100 }, presence: true

  #comment out lines 12 and 13 when using rails console to fix bcrypt error and uncomment out when running rails s
  validates :password, presence: true, length: { minimum: 6 }, if: -> { password_digest.nil? }
  validates :password, length: { minimum: 6 }, allow_blank: true

  validates :email,
             presence: true,
             uniqueness: { case_sensitive: false },
             length: { minimum: 3, maximum: 254 }

  #comment out line 21 when using rails console to fix bcrypt error and uncomment out when running rails s
  has_secure_password

  enum role: [:member, :admin, :moderator]
end
