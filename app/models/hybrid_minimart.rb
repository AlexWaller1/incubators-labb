class HybridMinimart < ActiveRecord::Base
    belongs_to :hybrid
    belongs_to :minimart
    validates_presence_of :visit_log
    validates :minimart_id, uniqueness: {scope: :hybrid_id}

    
end