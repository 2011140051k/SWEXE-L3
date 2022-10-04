class AddNameToTweets < ActiveRecord::Migration[5.2]
  def change
    add_column :tweets, :name, :string
  end
end
