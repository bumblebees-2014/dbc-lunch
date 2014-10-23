# Cohort email
# DBC::Cohort.find(58).email # =>  "bumblebees.2014@devbootcamp.com"
# Cohort ID
# DBC::Cohort.find(58).id # => "58"
# Cohort name
# DBC::Cohort.find(58).name #=> "Bumblebees 2014"
# Cohort start date
# DBC::Cohort.find(58).start_date # "2014-09-15"
# Cohort students
# DBC::Cohort.find(58).students
# Cohort each statement
# @student_array = DBC::Cohort.find(58).students.each do |student|
#   p student.name
# end
# => "Alex Ung"
# "Steve Ono"
# "Francisco De La Cruz"
# "Faraaz Nishtar"
# "Mark McQuillen"
# "Joseph McGrath"
# "Pablo Lopez Domowicz"
# "Courtney Nilan"
# "Edwin Kim"
# "Zachary Nagler"
# "Thomas Abend"
# "Stephanie Reaves"
# "Sean Ellis"
# "Robert Yang"
# "Kris Kane"

#DBC cohorts
#58 => bumblebees
#57 => mud turtles
#59 => ospreys

# How I'll implement javascript
# When you click on a certain meal, should be able to comment on it (or accept!)

# Create user accounts for everyone
DBC::Cohort.find(58).students.each do |student|
  User.create(name: student.name, username: student.name.gsub(/\s+/, "").downcase, password: student.name.gsub(/\s+/, "").downcase)
end

DBC::Cohort.find(57).students.each do |student|
  User.create(name: student.name, username: student.name.gsub(/\s+/, "").downcase, password: student.name.gsub(/\s+/, "").downcase)
end

DBC::Cohort.find(59).students.each do |student|
  User.create(name: student.name, username: student.name.gsub(/\s+/, "").downcase, password: student.name.gsub(/\s+/, "").downcase)
end

#retrieve what week via the lunch model
#no need to create separate table
#no need to use whenever because I'll have all the weeks store their lunches
array = (1..39).to_a

19.times do
  UpcomingLunch.create(lunchpartner1: User.find(array.shuffle!.pop), lunchpartner2: User.find(array.shuffle!.pop), location: "Dig Inn", date: Chronic.parse("tomorrow at noon"), lunchpartner1_accept: true, lunchpartner2_accept: true)
end
