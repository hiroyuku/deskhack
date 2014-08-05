class CreateTwitterUsers < ActiveRecord::Migration
  def change
    create_table :twitter_users do |t|
      t.string :provider, null:false
      t.string :uid, null:false
      t.string :nickname, null:false
      t.string :image_url, null:false
      t.timestamps
    end

    add_index :twitter_users, [:provider, :uid], unique: true
  end
end
