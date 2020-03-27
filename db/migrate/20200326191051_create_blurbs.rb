class CreateBlurbs < ActiveRecord::Migration[5.2]
  def change
    create_table :blurbs do |t|
      t.text :summary

      t.timestamps
    end
  end
end
