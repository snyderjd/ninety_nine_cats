# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Seed the database with some cats
Cat.destroy_all

cat1 = Cat.create!(birth_date: '2015/01/20', color: 'White', name: 'Whiskers', sex: 'M')
cat2 = Cat.create!(birth_date: '2017/02/17', color: 'Orange', name: 'Fluffy', sex: 'F')
cat3 = Cat.create!(birth_date: '2014/07/19', color: 'Brown', name: 'Moe', sex: 'M', description: 'Moe is a nice cat who likes to play with humans.')
cat3 = Cat.create!(birth_date: '2016/05/04', color: 'Gray', name: 'Curly', sex: 'F', description: 'Curly is an energetic cat who is not very nice and will steal your food if you are not careful.')
