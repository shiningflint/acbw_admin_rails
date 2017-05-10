class CreateSettings < ActiveRecord::Migration[5.0]
  def change
    create_table :settings do |t|
      t.string :photo_base_url

      t.timestamps
    end
  end
end
