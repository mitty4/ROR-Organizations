class AddCreatorToOrg < ActiveRecord::Migration
  def change
    add_column :orgs, :creator, :string
  end
end
