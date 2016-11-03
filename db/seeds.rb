# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

coffees = [
  {name: 'Arusha', species: 'Arabica', country: 'Tanzania'}, # √
  {name: 'Bergendal', species: 'Arabica', country: 'Indonesia'}, # √
  {name: 'Sidikalang', species: 'Arabica', country: 'Indonesia'}, # √
  {name: 'Blue Mountain', species: 'Arabica', country: 'Jamaica'}, # √
  {name: 'Bourbon', species: 'Arabica', country: 'Rwanda'}, # √
  {name: 'Catuai', species: 'Arabica', country: 'Brazil'},
  {name: 'Catimor', species: 'Interspecific hybrid', country: 'Indonesia'}, # √
  {name: 'Caturra', species: 'Arabica', country: 'Brazil'},
  {name: 'Colombian', species: 'Arabica', country: 'Colombia'},
  {name: 'Ethiopian Harar', species: 'Arabica', country: 'Ethiopia'},
  {name: 'Ethiopian Yirgacheffe', species: 'Arabica', country: 'Ethiopia'},
  {name: 'Guadeloupe Bonifieur', species: 'Arabica', country: 'Guadeloupe'},
  {name: 'Hawaiian Kona', species: 'Arabica', country: 'Hawaii'},
  {name: 'Java', species: 'Robusta', country: 'Indonesia'}, # √
  {name: 'Sarchimor', species: 'Interspecific hybrid', country: 'India'}, # √
  {name: 'Uganda', species: 'Robusta', country: 'Uganda'},
  {name: 'Brutte', species: 'Arabica', country: 'India'} # √
]

coffees.each do |coffee_data|
  coffee = CoffeeBean.find_or_initialize_by name: coffee_data[:name]

  coffee.update_attributes! coffee_data.except(:name)
end

suppliers = [
  {
    name: 'Chennai Tamil Nadu Inc.',
    coffees: [
      {name: 'Sarchimor', cost: '30.00', delivery_days: 30},
      {name: 'Brutte', cost: '38.00', delivery_days: 25}
    ]
  },
  {
    name: 'New Deli Coffee Conglomerate',
    coffees: [
      {name: 'Sarchimor', cost: '40.00', delivery_days: 25},
      {name: 'Brutte', cost: '35.00', delivery_days: 35}
    ]
  },
  {
    name: 'Mount Meru Exporters',
    coffees: [
      {name: 'Arusha', cost: '25.00', delivery_days: 15}
    ]
  },
  {
    name: 'Tanzania Exporters',
    coffees: [
      {name: 'Arusha', cost: '20.00', delivery_days: 20}
    ]
  },
  {
    name: 'Java International',
    coffees: [
      {name: 'Sidikalang', cost: '30.00', delivery_days: 30},
      {name: 'Catimor', cost: '45.00', delivery_days: 30},
      {name: 'Java', cost: '20.00', delivery_days: 30}
    ]
  },
  {
    name: 'Southeast Asia Trading Company',
    coffees: [
      {name: 'Bergendal', cost: '32.00', delivery_days: 25},
      {name: 'Sidikalang', cost: '28.00', delivery_days: 30},
      {name: 'Catimor', cost: '50.00', delivery_days: 20},
    ]
  },
  {
    name: 'Blue Mountain Coffees',
    coffees: [
      {name: 'Blue Mountain', cost: '35.00', delivery_days: 30}
    ]
  },
  {
    name: 'Rwanda Coffees',
    coffees: [
      {name: 'Bourbon', cost: '34.00', delivery_days: 25}
    ]
  }
]

suppliers.each do |supp|
  supplier = Supplier.find_or_create_by name: supp[:name]

  supp[:coffees].each do |coffee_data|
    coffee = CoffeeBean.find_by name: coffee_data[:name]

    link = CoffeeBeanSupplierLink.find_or_initialize_by coffee_bean: coffee, supplier: supplier

    link.update_attributes! coffee_data.except(:name)
  end
end
