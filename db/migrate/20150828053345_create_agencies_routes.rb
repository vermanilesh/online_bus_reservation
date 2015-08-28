class CreateAgenciesRoutes < ActiveRecord::Migration
  def change
    create_table :agencies_routes do |t|
      t.references :agency, index: true
      t.references :route, index: true
    end
  end
end
