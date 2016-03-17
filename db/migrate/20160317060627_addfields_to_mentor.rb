class AddfieldsToMentor < ActiveRecord::Migration
  def change
  	add_column :mentors, :profession, :string
  	add_column :mentors, :companyName, :string
  end
end
