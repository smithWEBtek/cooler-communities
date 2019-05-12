
User.create(first_name: "Brad", last_name: "Smith", email: "brad@mapc.org", password: "cooler", city: "Bedford", state: "NH", admin: true)
User.create(first_name: "Ryan", last_name: "Kelly", email: "rkelly@mapc.org", password: "cooler", city: "Boston", state: "MA", admin: true)
User.create(first_name: "Brad", last_name: "Hubbard-Nelson", email: "bradhn@mindspring.com", password: "cooler", city: "Concord", state: "MA", admin: true)
User.create(first_name: "Gilda", last_name: "Gussin", email: "gildagussin@gmail.com", password: "cooler", city: "Concord", state: "MA", admin: true)
User.create(first_name: "Jill", last_name: "Appel", email: "jill.appel@comcast.net", password: "cooler", city: "Concord", state: "MA", admin: true)

User.create(first_name: "Frank", last_name: "Sinatra", email: "frank@abc.com", password: "pointer", city: "New York", state: "NY")
User.create(first_name: "Nat", last_name: "Cole", email: "nat@abc.com", password: "pointer", city: "New York", state: "NY")
User.create(first_name: "Nancy", last_name: "Wilson", email: "nancy@abc.com", password: "pointer", city: "New York", state: "NY")
User.create(first_name: "Johnny", last_name: "Cash", email: "john@abc.com", password: "pointer", city: "Memphis", state: "TN")

Survey.create(title: "Cooler Communities", description: "Choosing behavior changes that reduce your carbon footprint.")

Question.import