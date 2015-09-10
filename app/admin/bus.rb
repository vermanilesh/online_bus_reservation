ActiveAdmin.register Bus do

	permit_params :bus_type, :seats, :registration_number

  index do
    selectable_column
    id_column
    column :registration_number
    column :bus_type
    column :seats
    column :created_at
    column :updated_at
    actions
  end

  index as: :grid do |bus|
    link_to image_tag(bus.avatar.url, size: "80x50"), admin_bus_path(bus)
  end
end
