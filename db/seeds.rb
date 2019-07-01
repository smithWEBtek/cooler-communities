def display_model_counts
  puts "**********************************************************"
  puts "**********************************************************"
  puts "States: #{State.count}"
  puts "Affiliations: #{Affiliation.count}"
  puts "Users: #{User.count}"
  puts "Questions: #{Question.count}"
  puts "Surveys: #{Survey.count}"
  puts "**********************************************************"
  puts "**********************************************************"
end

def main
  State.load_states
  Affiliation.import_affiliations_csv
  Survey.create(title: "Cooler Communities", description: "Choosing behavior changes that reduce your carbon footprint.")
  User.import_users_csv
  Question.import_airtable_cooler_csv
  display_model_counts
end

main
