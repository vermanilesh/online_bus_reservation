class AddAgencyRefToRoutes < ActiveRecord::Migration
  def change
    add_reference :routes, :agency, index: true
  end
end
