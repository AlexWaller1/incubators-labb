class User < ActiveRecord::Base
    has_many :hybrids
    has_many :friends, through: :hybrids
    has_many :places, through: :hybrids
    has_many :motorhomes, through: :hybrids
end