require 'rails_helper'

RSpec.describe Menu, type: :model do
  describe "validations" do
    it "is valid with a name" do
      menu = Menu.new(name: "Dinner Menu")
      expect(menu).to be_valid
    end
    
    it "is invalid without a name" do
      menu = Menu.new(name: nil)
      menu.valid?
      expect(menu.errors[:name]).to include("can't be blank")
    end
  end
  
  describe "behavior" do
    describe "#destroy" do
      it "is successfully deleted" do
        menu = Menu.create(name: "Dinner Menu")
        
        # Destroy the menu
        menu.destroy
        
        # Ensure menu item is removed from any associated menu
        expect(Menu.exists?(menu.id)).to be_falsey
      end

      it "deletes associated menu items when destroyed" do
        menu = Menu.create(name: "Dinner Menu")
        menu_item = MenuItem.create(name: "Example Item", price: 10.99, menu_id: menu.id)
        
        # Destroy the menu
        menu.destroy
        
        # Ensure menu items associated with the menu are deleted
        expect(MenuItem.exists?(menu_item.id)).to be_falsey
      end
    end
    
    describe "#update" do
      it "updates attributes of the menu" do
        menu = Menu.create(name: "Dinner Menu")
        
        # Update attribute
        new_name = "Lunch Menu"
        menu.update(name: new_name)
        
        # Ensure attribute is updated
        expect(menu.name).to eq(new_name)
      end
    end
  end
end
