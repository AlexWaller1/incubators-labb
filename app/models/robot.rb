class Robot < ActiveRecord::Base
    belongs_to :user
    has_many :industry_centers, through: :robot_industry_centers
    validates :name, presence: :true
    has_many :robot_industry_centers#, dependent: :destroy
end