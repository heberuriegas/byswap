class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.money :amount
      t.string :currency
      t.datetime :expires_at

      t.timestamps
    end
  end
end
