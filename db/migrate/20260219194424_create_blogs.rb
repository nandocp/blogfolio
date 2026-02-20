class CreateBlogs < ActiveRecord::Migration[8.1]
  def change
    create_table :blogs, id: :uuid, default: "uuidv7()" do |t|
      t.references :reviewed_by, type: :uuid, foreign_key: { to_table: :users }, index: false
      t.datetime :reviewed_at
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
