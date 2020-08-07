class CreateAlembicVersions < ActiveRecord::Migration[6.0]
  def change
    create_table :alembic_versions, {:id => false} do |t|
      t.string :version_num
      t.primary_key :alembic_version_pkc
    end
  end
end
