class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.column :admin, :boolean
      t.column :email, :string
      t.column :password_digest, :string
    end

    create_table :products do |t|
      t.column :name, :string
      t.column :price, :decimal
      t.column :desc, :string
    end

    create_table :carts do |t|
      t.column :user_id, :int
      t.column :product_id, :int
    end
  end
end
