ActiveAdmin.register Agency do

	permit_params :email

	filter :email
  filter :id
  index do
  	selectable_column
    id_column
    column :email
    column :created_at
    column :updated_at
    actions do |agency|
      item "Preview", admin_agency_path(agency), class: "member_link"
    end
  end
end
