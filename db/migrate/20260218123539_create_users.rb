# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[8.1]
  def change
    create_table :users, id: :uuid, default: "uuidv7()" do |t|
      t.string :name
      t.string :email

      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at

      t.timestamps
    end
  end
end
