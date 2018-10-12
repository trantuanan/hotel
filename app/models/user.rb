class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
    :recoverable, :rememberable, :validatable
  enum user_type: [:member, :admin]
  enum blocked: [:active, :blocked]
  has_many :relationships
  has_many :comments
  has_many :reviews
  has_many :replies
  has_many :likes
  PASSWORD_VALIDATOR = /(      # Start of group
        (?:                        # Start of nonmatching group, 4 possible solutions
          (?=.*[a-z])              # Must contain one lowercase character
          (?=.*[A-Z])              # Must contain one uppercase character
          (?=.*\W)                 # Must contain one non-word character or symbol
        |                          # or...
          (?=.*\d)                 # Must contain one digit from 0-9
          (?=.*[A-Z])              # Must contain one uppercase character
          (?=.*\W)                 # Must contain one non-word character or symbol
        |                          # or...
          (?=.*\d)                 # Must contain one digit from 0-9
          (?=.*[a-z])              # Must contain one lowercase character
          (?=.*\W)                 # Must contain one non-word character or symbol
        |                          # or...
          (?=.*\d)                 # Must contain one digit from 0-9
          (?=.*[a-z])              # Must contain one lowercase character
          (?=.*[A-Z])              # Must contain one uppercase character
        )                          # End of nonmatching group with possible solutions
        .*                         # Match anything with previous condition checking
      )/x                          # End of group

  validates :email, presence: true,
    length: {maximum: Settings.email_max_length},
    uniqueness: {case_sensitive: false}
  validates :password, {presence: true, format: {
    with: PASSWORD_VALIDATOR
  }}

  mount_uploader :picture, PictureUploader
end
