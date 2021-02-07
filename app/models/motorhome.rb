class Motorhome < ActiveRecord::Base
    validates :model, presence: true
    belongs_to :hybrid
end