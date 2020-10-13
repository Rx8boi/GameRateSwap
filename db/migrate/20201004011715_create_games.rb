class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.string :title
      t.string :description
      t.belongs_to :platform, foreign_key: true
      t.belongs_to :user, foreign_key: true
      t.timestamps
    end
  end
end
