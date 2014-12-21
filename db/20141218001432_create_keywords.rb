class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.references :admin_user, index: true
      t.text :query
      t.boolean :status

      t.timestamps
    end
  end
end
