class AddRouteRefToBuses < ActiveRecord::Migration
  def change
    add_reference :buses, :route, index: true
  end
end
