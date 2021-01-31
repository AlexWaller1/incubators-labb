class Hybrid < ActiveRecord::Base
    belongs_to :user
    has_many :friends
    has_many :places
    has_many :motorhomes
end