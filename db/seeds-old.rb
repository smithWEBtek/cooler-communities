User.create(first_name: "Brad", last_name: "Smith", email: "brad@mapc.org", password: "cooler", city: "Bedford", state: "NH", admin: true)
User.create(first_name: "Ryan", last_name: "Kelly", email: "rkelly@mapc.org", password: "cooler", city: "Boston", state: "MA", admin: true)
User.create(first_name: "Brad", last_name: "Hubbard-Nelson", email: "bradhn@mindspring.com", password: "cooler", city: "Concord", state: "MA", admin: true)
User.create(first_name: "Gilda", last_name: "Gussin", email: "gildagussin@gmail.com", password: "cooler", city: "Concord", state: "MA", admin: true)
User.create(first_name: "Jill", last_name: "Appel", email: "jill.appel@comcast.net", password: "cooler", city: "Concord", state: "MA", admin: true)

Survey.create(title: "Cooler Communities", description: "Choose behaviors to reduce your carbon footprint.", user_id: 1)
Survey.create(title: "Cooler Communities", description: "Choose behaviors to reduce your carbon footprint.", user_id: 2)
Survey.create(title: "Cooler Communities", description: "Choose behaviors to reduce your carbon footprint.", user_id: 3)
Survey.create(title: "Cooler Communities", description: "Choose behaviors to reduce your carbon footprint.", user_id: 4)
Survey.create(title: "Cooler Communities", description: "Choose behaviors to reduce your carbon footprint.", user_id: 5)

Category.create(title: 'Solar Power', description: 'Solar Power')
  Question.create(text: "Sign up for free solar assessment?", category_id: 1, survey_id: 1)
    Response.create(question_id: 1, label: "Yes / No", choice: true, choice_points: 1175, amount: nil, amount_points: 0)
  
  Question.create(text: "Install solar panels in 2019?", category_id: 1, survey_id: 1)
    Response.create(question_id: 2, label: "Yes / No", choice: true, choice_points: 5875, amount: nil, amount_points: 0)
    

Category.create(title: 'Yard and Landscaping', description: 'Yard and Landscaping')
  Question.create(text: "Sign up for low maintenance lawn assessment?", category_id: 2, survey_id: 1) 
    Response.create(question_id: 3, label: "Yes / No", choice: true, choice_points: 137, amount: nil, amount_points: 0)
    
  Question.create(text: "Use rake or electric blower for cleanup?", category_id: 2, survey_id: 1)
    Response.create(question_id: 4, label: "Yes / No", choice: true, choice_points: 194, amount: nil, amount_points: 0)

  Question.create(text: "Replace gas mower with manual or electric?", category_id: 2, survey_id: 1)
    Response.create(question_id: 5, label: "Yes / No", choice: true, choice_points: 396, amount: nil, amount_points: 0)

  Question.create(text: "Lower frequency of mowing?", category_id: 2, survey_id: 1)
    Response.create(question_id: 6, label: "Yes / No", choice: true, choice_points: 400, amount: nil, amount_points: 0)

  Question.create(text: "Reduce lawn size by square footage?", category_id: 2, survey_id: 1)
    Response.create(question_id: 7, label: "Yes / No", choice: true, choice_points: 120, amount: nil, amount_points: 0)

  Question.create(text: "Reduce number of fertilizer applications to?", category_id: 2, survey_id: 1)
    Response.create(question_id: 8, label: "Yes / No", choice: true, choice_points: 320, amount: nil, amount_points: 0)

  Category.create(title: 'Eating', description: 'Eating')
#   Question.create(text: "Goal meals per week: Beef/Lamb/Pork?", category_id: 1)
#   Question.create(text: "Goal meals per week: Poultry/Cheese/Fish/Seafood?", category_id: 1)
#   Question.create(text: "Goal meals per week: Vegetarian (w/ cheese, eggs)?", category_id: 1)
#   Question.create(text: "Goal meals per week: Vegetarian/Vegan (non-dairy)?", category_id: 1)

Category.create(title: 'Heating and Cooling Systems', description: 'Heating and Cooling Systems')
#   Question.create(text: "Sign up for free heating system assessment?", category_id: 2)
#   Question.create(text: "Upgrade to efficient boiler/furnace?", category_id: 2)
#   Question.create(text: "Install air-source heat pump(s)?", category_id: 2)

Category.create(title: 'Home Appliances', description: 'Home Appliances')
#   Question.create(text: "Replace refrigerator with Energy Star model in 2019?", category_id: 3) 
#   Question.create(text: "Replace clothes washer with Energy Star model in 2019?", category_id: 3) 
#   Question.create(text: "Number of cold water wash loads per week?", category_id: 3)
#   Question.create(text: "Number of clothes line or rack dry loads per week?", category_id: 3)
  
Category.create(title: 'Lighting', description: 'Lighting')
#   Question.create(text: "Sign up for free bulb swap?", category_id: 4)
#   Question.create(text: "Replace with LEDs this year?", category_id: 4)

Category.create(title: 'Transportation', description: 'Transportation')
#   Question.create(text: "New primary car in 2019?", category_id: 6)
#   Question.create(text: "Reduce primary car mileage by?", category_id: 6)
#   Question.create(text: "Reduce secondary car mileage by?", category_id: 6)
#   Question.create(text: "Achieve mileage reduction by Carpooling to/from work?", category_id: 6)
#   Question.create(text: "Achieve mileage reduction by Train/Bus/Public transportation?", category_id: 6)
#   Question.create(text: "Achieve mileage reduction by Telecommute (work at home)?", category_id: 6)
#   Question.create(text: "Achieve mileage reduction by Bike to work when possible?", category_id: 6)
#   Question.create(text: "Achieve mileage reduction by Bus/bike/walk to school or within town?", category_id: 6)
#   Question.create(text: "Achieve mileage reduction by Carpool regularly to children's activities?", category_id: 6)
  
Category.create(title: 'Reuse and Recycle', description: 'Reuse and Recycle')
#   Question.create(text: "Achieve reduction/recycling by using refillable containers (bags,mugs,bottles)?", category_id: 7)
#   Question.create(text: "Achieve reduction/recycling through buying to minimize packaging (bulk, powders)?", category_id: 7)
#   Question.create(text: "Achieve reduction/recycling through buying items made from recycled materials?", category_id: 7)
#   Question.create(text: "Achieve reduction/recycling through buying/selling used goods (Craigslist, consignment)?", category_id: 7)

Category.create(title: 'Water Heating', description: 'Water Heating')
#   Question.create(text: "Sign up for free hot water assessment?", category_id: 8)
#   Question.create(text: "Replace existing water heater w/ heat pump", category_id: 8)

Category.create(title: 'Weatherization and Thermostats', description: 'Weatherization and Thermostats')
#   Question.create(text: "Sign up for a free energy audit?", category_id: 9)
#   Question.create(text: "Insulate and/or air-seal the home?", category_id: 9)
#   Question.create(text: "Install Programmable Thermostats?", category_id: 9)
