class HybridPlace < ActiveRecord::Base

    belongs_to :hybrid
    belongs_to :place
    validates_presence_of :address

end