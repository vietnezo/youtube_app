class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :url
      t.text :description
      t.integer :like_number
      t.integer :dislike_number
      t.references :user

      t.timestamps
    end
  end
end
