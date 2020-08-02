class CreateIpAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :ip_addresses do |t|
      t.integer :user_id
      t.string :ip_address, unique: true

      t.timestamps
    end
  end
end
