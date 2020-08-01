class CreateVersionInfos < ActiveRecord::Migration[6.0]
  def change
    create_table :version_info, {:id => false} do |t|
      t.primary_key :version_info_id
      t.integer :schema_version
      t.string :library_version
    end
  end
end
