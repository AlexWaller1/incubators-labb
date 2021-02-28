class Skatepark < ActiveRecord::Base

    validates :name, presence: :true
    has_many :skateboarders
end