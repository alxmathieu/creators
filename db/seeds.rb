# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

puts 'Cleaning models...'
  Upvote.destroy_all
  Creator.destroy_all
  Batch.destroy_all
  User.destroy_all
puts 'Done!'


Creator.create(channel_url: "http://bit.ly/1sEbnIU", youtube_name: "Casey Neistat", description: "THE inventor of vlogging", video_url: "http://bit.ly/2mSafKI" )





 t.string "channel_url"
    t.string "youtube_name"
    t.text "description"
    t.string "video_url"
    t.integer "nb_followers"
    t.boolean "is_showcased"
    t.string "country"
    t.string "language"
    t.bigint "user_id"
    t.bigint "batch_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["batch_id"], name: "index_creators_on_batch_id"
    t.index ["user_id"], name: "index_creators_on_user_id"
