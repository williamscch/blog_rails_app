class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.text :text
      t.timestamp :CreatedAt
      t.timestamp :UpdatedAt

      t.timestamps
    end
  end
end
