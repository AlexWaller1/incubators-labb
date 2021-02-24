class Minimart < ActiveRecord::Base
    validates :name, presence: :true
    has_many :sodas
    has_many :hybrids
end