class CreateHeropowers < ActiveRecord::Migration[5.0]
  def change
    create_table :heropowers do |t|
      t.integer :superhero_id
      t.integer :superpower_id
      t.timestamps
    end
  end
end
