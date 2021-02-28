class Skatepark < ActiveRecord::Base

    validates :name, presence: :true
    has_many :skateboarders
    belongs_to :user
end