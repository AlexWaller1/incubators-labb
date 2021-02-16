class Place < ActiveRecord::Base
    validates :name, presence: true
    has_many :hybrid_places, dependent: :destroy
    has_many :hybrids, through: :hybrid_places
    
end