class CreateIpAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :ip_addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.column :ipaddress, 'integer unsigned'

      t.timestamps
    end
  end
end
