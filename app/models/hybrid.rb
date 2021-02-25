class Hybrid < ActiveRecord::Base
    validates :name, presence: true
    belongs_to :user
    has_many :friends
    has_many :hybrid_places, dependent: :destroy
    has_many :places, through: :hybrid_places
    has_many :motorhomes
    accepts_nested_attributes_for :places
    has_many :minimarts

    scope :ram_hybrids, -> { where(species: "Ram Hybrid") }
    scope :tree_hybrids, -> { where(species: "Tree Hybrid") }
    scope :trout_hybrids, -> { where(species: "Trout Hybrid") }
end