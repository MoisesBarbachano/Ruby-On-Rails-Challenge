class CreateWebsites < ActiveRecord::Migration[6.1]
  def change
    create_table :websites do |t|
      t.string :url
      t.string :short_url
      t.string :title
      t.integer :visited

      t.timestamps
    end
  end
end
