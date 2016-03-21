class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :doctor_id
      t.integer :patient_id
      t.datetime :appointment_time
      t.boolean :doctor_confirmed

      t.timestamps null: false
    end
  end
end
