owner = Role.create(name: "Owner")
clerk = Role.create(name: "Billing Clerk")
customer = Role.create!(name: "Online Customer")

User.create(role_id: owner.id, name: "Admin", email: "owner@email.com", password: "owner")
User.create(role_id: clerk.id, name: "Clerk", email: "clerk@email.com", password: "clerk")
User.create(role_id: customer.id, name: "Customer", email: "customer@email.com", password: "customer")

brakefast = MenuCategory.create(name: "Breakfast")
lunch = MenuCategory.create(name: "Lunch")
dinner = MenuCategory.create(name: "Dinner")

MenuCategoryItem.create(menu_category_id: brakefast.id, menu_item_id: MenuItem.create(name: "Idly", description: "Idly is a type of savoury rice cake.", price: 10).id)
MenuCategoryItem.create(menu_category_id: brakefast.id, menu_item_id: MenuItem.create(name: "Pongal", description: "South Indian rice dish.", price: 50).id)
MenuCategoryItem.create(menu_category_id: brakefast.id, menu_item_id: MenuItem.create(name: "Poori", description: "Poori is a high-fat fried bread.", price: 30).id)
MenuCategoryItem.create(menu_category_id: brakefast.id, menu_item_id: MenuItem.create(name: "Idiyappam", description: "Idiyappam is a rice noodle dish.", price: 30).id)
MenuCategoryItem.create(menu_category_id: brakefast.id, menu_item_id: MenuItem.create(name: "Appam", description: "Appam is a type of pancake.", price: 30).id)

MenuCategoryItem.create(menu_category_id: lunch.id, menu_item_id: MenuItem.create(name: "Meals", description: "Meals are made up of appetizer, main dish, and dessert.", price: 80).id)
MenuCategoryItem.create(menu_category_id: lunch.id, menu_item_id: MenuItem.create(name: "Sambar Rice", description: "Sambar rice is combination of rice and sambar.", price: 50).id)
MenuCategoryItem.create(menu_category_id: lunch.id, menu_item_id: MenuItem.create(name: "Tomato Rice", description: "Tomato rice is tomato flavored rice", price: 50).id)
MenuCategoryItem.create(menu_category_id: lunch.id, menu_item_id: MenuItem.create(name: "Pulao", description: "Pulao is made by rice, vegetables, and spices.", price: 70).id)
MenuCategoryItem.create(menu_category_id: lunch.id, menu_item_id: MenuItem.create(name: "Veg Biriyani", description: "Biriyani is a mixed rice dish", price: 70).id)

MenuCategoryItem.create(menu_category_id: dinner.id, menu_item_id: MenuItem.create(name: "Chicken Biriyani", description: "Biriyani is a mixed rice dish", price: 100, veg: false).id)
MenuCategoryItem.create(menu_category_id: dinner.id, menu_item_id: MenuItem.create(name: "Mutton Biriyani", description: "Biriyani is a mixed rice dish", price: 200, veg: false).id)
MenuCategoryItem.create(menu_category_id: dinner.id, menu_item_id: MenuItem.create(name: "Parotta", description: "Parotta is a layered flatbread.", price: 10).id)
MenuCategoryItem.create(menu_category_id: dinner.id, menu_item_id: MenuItem.create(name: "Chapati", description: "Chapati is an unleavened flatbread.", price: 10).id)
MenuCategoryItem.create(menu_category_id: dinner.id, menu_item_id: MenuItem.create(name: "Veg Fried Rice", description: "Fried rice is a dish of cooked rice that has been stir-fried.", price: 100).id)
MenuCategoryItem.create(menu_category_id: dinner.id, menu_item_id: MenuItem.create(name: "Chicken Fried Rice", description: "Fried rice is a dish of cooked rice that has been stir-fried.", price: 120, veg: false).id)
MenuCategoryItem.create(menu_category_id: dinner.id, menu_item_id: MenuItem.create(name: "Chicken Noodles", description: "Noodles made from unleavened dough which is rolled flat and cut", price: 120, veg: false).id)

MenuCategoryItem.create(menu_category_id: dinner.id, menu_item_id: 1)
MenuCategoryItem.create(menu_category_id: lunch.id, menu_item_id: 11)
MenuCategoryItem.create(menu_category_id: lunch.id, menu_item_id: 12)

Status.create(name: "pending")
Status.create(name: "delevered")
Status.create(name: "canceled")
