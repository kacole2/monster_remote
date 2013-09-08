class CreateRasberryPis < ActiveRecord::Migration
  def change
    create_table :rasberry_pis do |t|
      t.string :ipdns
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
