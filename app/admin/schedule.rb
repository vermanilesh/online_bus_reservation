ActiveAdmin.register Schedule do
  permit_params :departure_time, :arrival_time, :fare, :route_id
end
