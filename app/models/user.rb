class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy

  belongs_to :staff_member, optional: true

  enum :role, { owner: "owner", mechanic: "mechanic", counter: "counter" }

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  validates :email_address, presence: true, uniqueness: { case_sensitive: false },
                            format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 10 }, allow_nil: true
end
