class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.references :result, index: true
      t.integer :rank
      t.text :url
      t.text :title
      t.text :description

      t.timestamps
    end
  end
end
