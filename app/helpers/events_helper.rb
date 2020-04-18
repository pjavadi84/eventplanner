module EventsHelper
    def property_id_field(event)
        if event.property.nil?
            select_tag "event[property_id]", option_from_collection_for_select(Property.all, :id, :property_name)
        else
            hidden_field_tag "event[property_id]", event.property_id
        end
    end
end