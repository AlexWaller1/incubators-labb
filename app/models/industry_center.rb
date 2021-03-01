class IndustryCenter < ActiveRecord::Base
    belongs_to :user
    has_many :robots, through: :robot_industry_centers
    has_many :robot_industry_centers, dependent: :destroy
end