class Supervisor < ActiveRecord::Base
    validates :name, presence: :true
    has_many :supervisor_robots, dependent: :destroy
    has_many :robots, through: :supervisor_robots, dependent: :destroy
    accepts_nested_attributes_for :robots
end