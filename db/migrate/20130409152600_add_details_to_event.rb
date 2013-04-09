class AddDetailsToEvent < ActiveRecord::Migration
  def change
    add_column :events, :description, :string
    add_column :events, :link, :string
    add_column :events, :host, :string
  end
end
