class Robot < ActiveRecord::Base
    belongs_to :user
    has_many :supervisor_robots, dependent: :destroy
    has_many :robots, through: :supervisor_robots
    validates :name, presence: :true
    
end