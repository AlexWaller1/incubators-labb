module ApplicationHelper

    def locations
        Place.all.map{|place| place.location}.select{|location| location != ""}
    end
end
