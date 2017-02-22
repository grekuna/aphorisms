class CreateAphorisms < ActiveRecord::Migration[5.0]
  def change
    create_table :aphorisms do |t|
      t.integer :author_id
      t.text :aphorism

      t.timestamps
    end
  end
end
