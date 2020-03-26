class CreatePersons < ActiveRecord::Migration[5.2]
  def change
    create_table :directors do |t|
      with_options null: false do
        t.string :first_name
        t.string :last_name
        t.text :aliases
      end
    end
    create_table :producers do |t|
      with_options null: false do
        t.string :first_name
        t.string :last_name
        t.text :aliases
      end
    end
    end
end
