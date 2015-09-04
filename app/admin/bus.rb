ActiveAdmin.register Bus do

	menu parent: "Agency"

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
	permit_params :bus_type, :seats, :registration_number
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

	index do
		column :id
		column :registration_number
		column :bus_type
		column :seats
	end


end
