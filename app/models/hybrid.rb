class Hybrid < ActiveRecord::Base
    validates :name, presence: true
    belongs_to :user
    has_many :friends
    has_many :hybrid_places, dependent: :destroy
    #if the hybrid is deleted then its hybrid_places and hybrid_minimarts will be destroyed too.
    has_many :hybrid_minimarts, dependent: :destroy
    has_many :places, through: :hybrid_places
    has_many :minimarts, through: :hybrid_minimarts
    has_many :motorhomes
    accepts_nested_attributes_for :places
    accepts_nested_attributes_for :minimarts
   

    scope :ram_hybrids, -> { where(species: "Ram Hybrid") }
    scope :tree_hybrids, -> { where(species: "Tree Hybrid") }
    scope :trout_hybrids, -> { where(species: "Trout Hybrid") }
end