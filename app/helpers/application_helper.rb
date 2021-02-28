module ApplicationHelper

    def locations
        Place.all.map{|place| place.location}.select{|location| location != ""}
    end

    def minimart_helper
        Minimart.all.map{|p| [p.name, p.id]}
    end

    def place_helper
        Place.all.map{|p| [p.name, p.id]}
    end
end
