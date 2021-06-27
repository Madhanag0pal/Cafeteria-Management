owner = Role.create(name: "Owner")
Role.create(name: "Billing Clerk")
customer = Role.create!(name: "Online Customer")

User.create(role_id: owner.id, name: "Admin", email: "owner@email.com", password: "owner")
User.create(role_id: customer.id, name: "Customer", email: "customer@email", password: "owner")

brakefast = MenuCategory.create(name: "Breakfast")
lunch = MenuCategory.create(name: "Lunch")

MenuItem.create(menu_category_id: brakefast.id, name: "Idly", price: 10)
MenuItem.create(menu_category_id: brakefast.id, name: "Pongal", price: 30)
MenuItem.create(menu_category_id: brakefast.id, name: "Poori", price: 30)

MenuItem.create(menu_category_id: lunch.id, name: "Meals", price: 80)
MenuItem.create(menu_category_id: lunch.id, name: "Sambar raice", price: 50)
MenuItem.create(menu_category_id: lunch.id, name: "Tomato raice", price: 50)
