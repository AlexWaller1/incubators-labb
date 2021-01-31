class Motorhome < ActiveRecord::Base
    validates :model, presence: true
    belongs_to :hybrids
end