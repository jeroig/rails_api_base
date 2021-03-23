class CreateTargets < ActiveRecord::Migration[6.1]
  def change
    create_table :targets do |t|
      t.references :user, null: false, foreign_key: true
      t.references :topic, null: false, foreign_key: true
      t.string :title
      t.string :address
      t.float :latitude
      t.float :longitude
      t.integer :radius

      t.timestamps
    end
  end
end
