class User < ActiveRecord::Base
    #has_secure_password
    validates :username, :password, presence: true
    validates_uniqueness_of :username
    has_many :hybrids
    has_many :friends, through: :hybrids
    has_many :places, through: :hybrids
    has_many :motorhomes, through: :hybrids
end