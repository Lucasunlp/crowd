class AddActorToPerson < ActiveRecord::Migration[5.2]
  def change
    create_table :actors do |t|
      with_options null: false do
        t.string :first_name
        t.string :last_name
        t.text :aliases
      end
    end
  end
end
