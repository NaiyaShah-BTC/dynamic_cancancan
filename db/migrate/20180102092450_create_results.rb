class CreateResults < ActiveRecord::Migration[5.1]
  def change
    create_table :results do |t|
      t.integer :exam_id
      t.integer :marks

      t.timestamps
    end
  end
end
