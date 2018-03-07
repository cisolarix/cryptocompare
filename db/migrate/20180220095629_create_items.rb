class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :iosts do |t|
      t.string :time
      t.string :close
      t.string :high
      t.string :low
      t.string :open
      t.string :volumefrom
      t.string :volumeto
      t.timestamps null: false
    end

    add_index :iosts, [:time], name: 'items_time_index'

    create_table :btcs do |t|
      t.string :time
      t.string :close
      t.string :high
      t.string :low
      t.string :open
      t.string :volumefrom
      t.string :volumeto
      t.timestamps null: false
    end

    add_index :btcs, [:time], name: 'items_time_index'

    create_table :eths do |t|
      t.string :time
      t.string :close
      t.string :high
      t.string :low
      t.string :open
      t.string :volumefrom
      t.string :volumeto
      t.timestamps null: false
    end

    add_index :eths, [:time], name: 'items_time_index'

    create_table :dtas do |t|
      t.string :time
      t.string :close
      t.string :high
      t.string :low
      t.string :open
      t.string :volumefrom
      t.string :volumeto
      t.timestamps null: false
    end

    add_index :dtas, [:time], name: 'items_time_index'
  end
end
