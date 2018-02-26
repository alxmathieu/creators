class CreateCreators < ActiveRecord::Migration[5.1]
  def change
    create_table :creators do |t|
      t.string :channel_url
      t.string :youtube_name
      t.text :description
      t.string :video_url
      t.integer :nb_followers
      t.boolean :is_showcased
      t.string :country
      t.string :language
      t.references :user, foreign_key: true
      t.references :batch, foreign_key: true

      t.timestamps
    end
  end
end
