# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

categories = ["Manager", "Security", "HouseKeeping", "STP", "WTP", "Lift", "Gym/PlayArea", "Pool", "Electrician", "Plumber", "Garbage", "Grills", "UPVC", "DG", "Garden", "Medical", "MosquitoFogging"]
categories.each do |category_name|
  Category.find_or_create_by(name: category_name)
end

year = Date.today.year  # 2019 - May vary next year
settings = [
  ["MAINTENANCE_#{year}_Q0_PER_MONTH", '2500'],
  ["MAINTENANCE_#{year}_Q0_DUE_DATE", "31/Jan/#{year}"],
  ["MAINTENANCE_#{year}_Q1_PER_MONTH", '2900'],
  ["MAINTENANCE_#{year}_Q1_DUE_DATE", "10/Apr/#{year}"],
  ["MAINTENANCE_#{year}_Q2_PER_MONTH", '2900'],
  ["MAINTENANCE_#{year}_Q2_DUE_DATE", "10/Jul/#{year}"],
  ["MAINTENANCE_#{year}_Q3_PER_MONTH", '2900'],
  ["MAINTENANCE_#{year}_Q3_DUE_DATE", "10/Oct/#{year}"],
  ["CORPUSFUND_#{year}_Q0_DUE_DATE", "30/Jun/#{year}"],
  ["CORPUSFUND_#{year}_Q1_DUE_DATE", "10/Aug/#{year}"],
  ["CORPUSFUND_#{year}_Q2_DUE_DATE", "10/Nov/#{year}"],
  ["CORPUSFUND_#{year}_Q3_DUE_DATE", "10/Feb/#{year}"],
  ['FEEDBACK_CONTACT', 'pradeepkumar.2win@gmail.com'],
  ['PARTYHALL_CONTACT', 'apowa-ec@googlegroups.com']
]
settings.each do |setting_arr|
  setting = Setting.find_or_initialize_by(name: setting_arr[0])
  setting.value = setting_arr[1]
  setting.save
end
