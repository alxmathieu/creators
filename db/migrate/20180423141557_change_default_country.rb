class ChangeDefaultCountry < ActiveRecord::Migration[5.1]
  def change
    change_column_default :creators, :country, "France"
  end
end
