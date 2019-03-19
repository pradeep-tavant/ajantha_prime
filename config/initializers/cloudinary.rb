Cloudinary.config do |config|
  config.cloud_name = ENV["CLOUD_NAME"]
  config.api_key = ENV["CLOUD_API_KEY"]
  config.api_secret = ENV["CLOUD_API_SECRET"]
end

DOCUMENTS_LINKS = [
  ["Waste_Segregation_Chart.pdf", "https://res.cloudinary.com/ajanthaprime/image/upload/v1552982070/Documents/Waste_Segregation_Chart.pdf"],
  ["Ajantha_Prime_OC.pdf", "https://res.cloudinary.com/ajanthaprime/image/upload/v1552982068/Documents/Ajantha_Prime_OC.pdf"],
  ["Party_Hall_Booking_Rules.pdf", "https://res.cloudinary.com/ajanthaprime/image/upload/v1552982044/Documents/Party_Hall_Booking_Rules.pdf"],
  ["Ajantha_Prime_Membership_Form.pdf", "https://res.cloudinary.com/ajanthaprime/image/upload/v1552982020/Documents/Ajantha_Prime_Membership_Form.pdf"]
]
