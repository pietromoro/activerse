class CreateActiverseSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :activerse_settings do |t|
      t.unique :key
      t.string :value

      t.timestamps
    end
  end
end
