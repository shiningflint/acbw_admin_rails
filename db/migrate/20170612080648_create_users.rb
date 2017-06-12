class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    if ActiveRecord::Base.connection.table_exists? :users
      drop_table :users
    end
    create_table :users do |t|
      t.string :name
      t.string :password_digest

      t.timestamps
    end
  end
end
