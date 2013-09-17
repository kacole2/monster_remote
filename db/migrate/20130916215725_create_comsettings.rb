class CreateComsettings < ActiveRecord::Migration
  def change
    create_table :comsettings do |t|
      t.string :comport
      t.integer :baud

      t.timestamps
    end
  end
end
