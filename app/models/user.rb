class User < ActiveRecord::Base
    has_secure_password
    validates :username, :password_digest, presence: true
    validates_uniqueness_of :username
    has_many :hybrids
    has_many :friends, through: :hybrids
    has_many :places, through: :hybrids
    has_many :motorhomes, through: :hybrids
    has_many :sodas
    has_many :minimarts
end