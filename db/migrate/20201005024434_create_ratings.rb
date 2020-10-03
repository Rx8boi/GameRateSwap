class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
    	t.integer "stars"
    	t.string "difficulty"
    	t.integer "game_id"
    	t.integer "user_id"
    	t.datetime "reviewed_at"
    end
  end
end
