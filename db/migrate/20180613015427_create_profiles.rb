class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.string :fname
      t.string :lname
      t.integer :age
      t.integer :weight
      t.integer :height
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
