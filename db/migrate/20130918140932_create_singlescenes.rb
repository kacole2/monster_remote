class CreateSinglescenes < ActiveRecord::Migration
  def change
    create_table :singlescenes do |t|
      t.string :slot

      t.timestamps
    end
  end
end
