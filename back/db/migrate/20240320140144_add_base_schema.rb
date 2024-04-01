class AddBaseSchema < ActiveRecord::Migration[7.1]
  def change
    create_table :languages do |t|
      t.string :name

      t.timestamps
    end

    create_table :lessons do |t|
      t.string :name
      t.belongs_to :language

      t.timestamps
    end

    create_table :words do |t|
      t.string :name
      t.string :meaning
      t.belongs_to :lesson

      t.timestamps
    end

    create_table :sentences do |t|
      t.string :text
      t.string :inflection
      t.belongs_to :word

      t.timestamps
    end
  end
end
