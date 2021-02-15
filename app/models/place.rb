class Place < ActiveRecord::Base
    validates :name, presence: true
    has_many :hybrid_places
    has_many :hybrids, through: :hybrid_places
    
end