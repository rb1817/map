class CreateQnas < ActiveRecord::Migration[5.0]
  def change
    create_table :qnas do |t|
      t.string :user_name
      t.string :title
      t.text :content
      t.string :answer_email

      t.timestamps
    end
  end
end
