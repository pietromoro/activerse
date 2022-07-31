class CreateActiverseSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :activerse_settings do |t|
      t.string :key, null: false
      t.string :value, null: false

      t.timestamps
    end

    add_index :activerse_settings, :key, unique: true
  end
end
