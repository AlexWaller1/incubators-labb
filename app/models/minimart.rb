class Minimart < ActiveRecord::Base
    validates :name, presence: :true
    validates :state, presence: :true
    has_many :sodas
    has_many :hybrids, through: :hybrid_minimarts
    belongs_to :user
end