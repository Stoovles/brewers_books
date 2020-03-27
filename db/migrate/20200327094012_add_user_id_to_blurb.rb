class AddUserIdToBlurb < ActiveRecord::Migration[5.2]
  def change
    add_column :blurbs, :user_id, :integer
  end
end
