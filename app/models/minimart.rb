class Minimart < ActiveRecord::Base
    validates :name, presence: :true
    validates :state, presence: :true
    has_many :sodas
    has_many :hybrid_minimarts, dependent: :destroy
    has_many :hybrids, through: :hybrid_minimarts
    #must establish relationship with hybrid_minimarts before 
    #establishing through relationship with :hybrids
    belongs_to :user
end