ActiveAdmin.register Agency do

	#menu priority: 10, label: "Agency's Menu", parent: "Owner"

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
	permit_params :email, routes_attributes: [:id, :from_station, :to_station, :distance]
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

	index do
		selectable_column
		id_column
		column :email
	end

	filter :email
	filter :id

end
