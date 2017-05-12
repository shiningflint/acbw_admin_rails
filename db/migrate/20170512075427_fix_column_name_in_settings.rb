class FixColumnNameInSettings < ActiveRecord::Migration[5.0]
  def change
    rename_column :settings, :photo_base_url, :setting_name
  end
end
