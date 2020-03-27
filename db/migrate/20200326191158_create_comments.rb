class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :blurb_id
      t.string :comment

      t.timestamps
    end
  end
end
