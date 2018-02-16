class CreateWelcomes < ActiveRecord::Migration[5.1]
  def change
    create_table :welcomes do |t|
      t.string :text
      t.integer :number

      t.timestamps
    end
  end
end
