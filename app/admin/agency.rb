ActiveAdmin.register Agency do

	permit_params :email

	filter :email
	filter :id
end
