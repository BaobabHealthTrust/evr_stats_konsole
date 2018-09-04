class CreateSiteDetails < ActiveRecord::Migration[5.1]
  def change
    create_table :site_details do |t|
      t.string :site_name
      t.string :site_ip

      t.timestamps
    end
  end
end
