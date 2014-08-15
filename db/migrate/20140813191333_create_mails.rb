class CreateMails < ActiveRecord::Migration
  def change
    create_table :mails do |t|
      t.string :subject
      t.text :content
      t.integer :user_id

      t.timestamps
    end
    add_index :mails, :created_at
  end
end
