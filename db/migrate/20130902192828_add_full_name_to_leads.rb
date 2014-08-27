class AddFullNameToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :full_name, :string
  end
end
