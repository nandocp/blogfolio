class CreatePortfolios < ActiveRecord::Migration[8.1]
  def change
    create_table :portfolios, id: :uuid, default: "uuidv7()" do |t|
      t.datetime :designed_at
      t.string :company_name
      t.integer :contract_type

      t.timestamps
    end
  end
end
