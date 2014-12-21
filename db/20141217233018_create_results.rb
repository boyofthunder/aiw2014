class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.references :keyword, index: true
      t.datetime :date

      t.timestamps
    end
  end
end
