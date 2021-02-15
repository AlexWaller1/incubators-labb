class Hybrid < ActiveRecord::Base
    validates :name, presence: true
    belongs_to :user
    has_many :friends
    has_many :hybrid_places
    has_many :places, through: :hybrid_places
    has_many :motorhomes
    accepts_nested_attributes_for :places
end