class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name, default: ''
      t.string :last_name, default: ''
      t.date :birth_date
      t.string :gender, default: 'male'
      t.string :address, default: ''
      t.string :city, default: ''
      t.string :state, default: ''
      t.string :country, default: ''
      t.string :zipcode, default: ''
      t.string :phone, default: ''

      t.timestamps null: false
    end
  end
end
