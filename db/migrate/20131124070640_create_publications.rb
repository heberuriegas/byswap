class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.money :amount
      t.datetime :expires_at
      t.references :user

      t.timestamps
    end
  end
end
