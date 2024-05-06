require 'rails_helper'

RSpec.describe MenuItem, type: :model do
  describe "validations" do
    it "is valid with name, price, and menu_id" do
      menu = Menu.create(name: "Dinner Menu")
      menu_item = MenuItem.new(name: "Example Item", price: 10.99, menu_id: menu.id)
      expect(menu_item).to be_valid
    end
    
    it "is invalid without a name" do
      menu = Menu.create(name: "Dinner Menu")
      menu_item = MenuItem.new(name: nil, price: 10.99, menu_id: menu.id)
      menu_item.valid?
      expect(menu_item.errors[:name]).to include("can't be blank")
    end
    
    it "is invalid without a price" do
      menu = Menu.create(name: "Dinner Menu")
      menu_item = MenuItem.new(name: "Example Item", price: nil, menu_id: menu.id)
      menu_item.valid?
      expect(menu_item.errors[:price]).to include("can't be blank")
    end
    
    it "is invalid without a menu_id" do
      menu_item = MenuItem.new(name: "Example Item", price: 10.99, menu_id: nil)
      menu_item.valid?
      expect(menu_item.errors[:menu_id]).to include("can't be blank")
    end

    it "is invalid with non-numeric price" do
      menu = Menu.create(name: "Dinner Menu")
      menu_item = MenuItem.new(name: "Example Item", price: "not_a_price", menu_id: menu.id)
      menu_item.valid?
      expect(menu_item.errors[:price]).to include("is not a number")
    end
    
    it "is invalid with non-integer menu_id" do
      menu_item = MenuItem.new(name: "Example Item", price: 10.99, menu_id: "not_an_integer")
      menu_item.valid?
      expect(menu_item.errors[:menu_id]).to include("must be an integer")
    end

  end
  
  describe "behavior" do
    describe "#delete" do
      it "is successfully deleted" do
        menu = Menu.create(name: "Dinner Menu")
        menu_item = MenuItem.create(name: "Example Item", price: 10.99, menu_id: menu.id)
        
        # Destroy the menu item
        menu_item.destroy
        
        # Ensure menu item is removed from any associated menu
        expect(MenuItem.exists?(menu_item.id)).to be_falsey
      end
    end
    
    describe "#update" do
      it "updates attributes of the menu item" do
        menu = Menu.create(name: "Dinner Menu")
        menu_item = MenuItem.create(name: "Example Item", price: 10.99, menu_id: menu.id)
        
        # Update attributes
        new_name = "Updated Item"
        new_price = 15.99
        
        menu_item.update(name: new_name, price: new_price)
        
        # Ensure attributes are updated
        expect(menu_item.name).to eq(new_name)
        expect(menu_item.price).to eq(new_price)
      end
    end
  end

  describe "associations" do
    it "belongs to a menu" do
      association = described_class.reflect_on_association(:menu)
      expect(association.macro).to eq :belongs_to
    end
  end
end
