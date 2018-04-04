class CreateContents < ActiveRecord::Migration[5.1]
  def change
    create_table :contents do |t|
      t.integer :page_id
      t.integer :html_tag_id
      t.text :info

      t.timestamps
    end

    add_index(:contents, [:page_id, :html_tag_id])
  end
end
