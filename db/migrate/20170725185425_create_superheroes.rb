class CreateSuperheroes < ActiveRecord::Migration[5.0]
  def change
    create_table :superheroes do |t|
      t.string :name
      t.string :super_name
      t.string :superpower_id

      t.timestamps
    end
  end
end
