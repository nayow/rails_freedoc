class AddDetailsToSpecialities < ActiveRecord::Migration[5.2]
  def change
    add_column :specialities, :name, :string
  end
end
