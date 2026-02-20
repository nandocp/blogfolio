class CreateEntries < ActiveRecord::Migration[8.1]
  def change
    create_table :entries, id: :uuid, default: "uuidv7()" do |t|
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.string :title, null: false, limit: 70
      t.string :subtitle, limit: 70
      t.string :description, limit: 120
      t.text :text, null: false
      t.string :entryable_type
      t.uuid :entryable_id
      t.string :i18n, limit: 7, default: 'pt-br'

      t.timestamps
    end
  end
end
