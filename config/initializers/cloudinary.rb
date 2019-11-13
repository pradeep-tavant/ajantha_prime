Cloudinary.config do |config|
  config.cloud_name = ENV["CLOUD_NAME"]
  config.api_key = ENV["CLOUD_API_KEY"]
  config.api_secret = ENV["CLOUD_API_SECRET"]
end

DOCUMENTS_LINKS = [
  ["APOWA_MOM_GBM_2_Jun_2019.docx", "https://res.cloudinary.com/ajanthaprime/raw/upload/v1560572555/Documents/"],
  # ["APOWA_Expense_Report.xlsx", "https://res.cloudinary.com/ajanthaprime/raw/upload/v1553239907/Documents/"],
  ["Waste_Segregation_Chart.pdf", "https://res.cloudinary.com/ajanthaprime/image/upload/v1552982070/Documents/"],
  ["Ajantha_Prime_OC.pdf", "https://res.cloudinary.com/ajanthaprime/image/upload/v1552982068/Documents/"],
  ["Party_Hall_Booking_Rules.pdf", "https://res.cloudinary.com/ajanthaprime/image/upload/v1552982044/Documents/"],
  ["Ajantha_Prime_Membership_Form.pdf", "https://res.cloudinary.com/ajanthaprime/image/upload/v1552982020/Documents/"]
]

FINANCIAL_REPORTS = [
  ["APOWA-PreRegistration-Financial-Report.pdf", "https://res.cloudinary.com/ajanthaprime/image/upload/v1573667368/financial_reports/"],
  ["APOWA-Financial-Report-Jan-2019.pdf", "https://res.cloudinary.com/ajanthaprime/image/upload/v1573667368/financial_reports/"],
  ["APOWA-Financial-Report-Feb-2019.pdf", "https://res.cloudinary.com/ajanthaprime/image/upload/v1573667368/financial_reports/"],
  ["APOWA-Financial-Report-Mar-2019.pdf", "https://res.cloudinary.com/ajanthaprime/image/upload/v1573667369/financial_reports/"],
  ["APOWA-Financial-Report-Apr-2019.pdf", "https://res.cloudinary.com/ajanthaprime/image/upload/v1573667368/financial_reports/"],
  ["APOWA-Financial-Report-May-2019.pdf", "https://res.cloudinary.com/ajanthaprime/image/upload/v1573667368/financial_reports/"],
  ["APOWA-Financial-Report-Jun-2019.pdf", "https://res.cloudinary.com/ajanthaprime/image/upload/v1573667368/financial_reports/"],
  ["APOWA-Financial-Report-Jul-2019.pdf", "https://res.cloudinary.com/ajanthaprime/image/upload/v1573667367/financial_reports/"],
  ["APOWA-Financial-Report-Aug-2019.pdf", "https://res.cloudinary.com/ajanthaprime/image/upload/v1573667368/financial_reports/"],
  ["APOWA-Financial-Report-Sep-2019.pdf", "https://res.cloudinary.com/ajanthaprime/image/upload/v1573667369/financial_reports/"]
]