class CreateMoments < ActiveRecord::Migration[6.1]
  def change
    create_table :moments do |t|
      t.string :title
      t.text :description
      t.date :date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
