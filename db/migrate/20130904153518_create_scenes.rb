class CreateScenes < ActiveRecord::Migration
  def change
    create_table :scenes do |t|
      t.string :name
      t.boolean :enabled

      t.timestamps
    end
  end
end
