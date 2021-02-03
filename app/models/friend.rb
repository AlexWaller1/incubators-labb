class Friend < ActiveRecord::Base
    validates :name, presence: true
    belongs_to :hybrid
end