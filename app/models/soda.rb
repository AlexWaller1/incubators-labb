class Soda < ActiveRecord::Base
    validates :name, presence: :true
    belongs_to :minimart
end