ActiveAdmin.register Route do
  permit_params :from_station, :to_station, :distance
end
