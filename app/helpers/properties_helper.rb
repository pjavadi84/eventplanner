module PropertiesHelper
    def user_id_field(property)
        if property.user.nil?
            select_tag "property[user_id]", option_from_collection_for_select(User.all, :id, :fullname)
        else
            hidden_field_tag "property[user_id]", property.user_id
        end
    end
end