class RobotIndustryCenter < ActiveRecord::Base
    belongs_to :industry_center
    belongs_to :robot
    validates :performance_review, presence: :true
end