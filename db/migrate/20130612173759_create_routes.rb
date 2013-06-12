class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :description

      t.timestamps
    end
  end
end
