class SupervisorRobots < ApplicationController
    validates :evaluation, presence: :true
    belongs_to :supervisor
    belongs_to :robot
end