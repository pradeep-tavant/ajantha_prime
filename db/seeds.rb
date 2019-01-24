# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

categories = ["Manager", "Security", "HouseKeeping", "STP", "WTP", "Lift", "Gym/PlayArea", "Pool", "Electrician", "Plumber", "Garbage", "Grills", "UPVC", "DG", "Garden", "Medical", "MosquitoFogging"]
categories.each do |category_name|
  Category.find_or_create_by(name: category_name)
end