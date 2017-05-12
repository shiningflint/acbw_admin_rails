class AddSettingValueToSettings < ActiveRecord::Migration[5.0]
  def change
    add_column :settings, :setting_value, :text
  end
end
