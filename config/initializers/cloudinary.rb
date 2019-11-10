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
  ["APOWA-Finacial-Report-Jan-2019.pdf", "https://res.cloudinary.com/ajanthaprime/image/upload/v1573379317/financial_reports/"],
  ["APOWA-Finacial-Report-Feb-2019.pdf", "https://res.cloudinary.com/ajanthaprime/image/upload/v1573379354/financial_reports/"],
  ["APOWA-Finacial-Report-Mar-2019.pdf", "https://res.cloudinary.com/ajanthaprime/image/upload/v1573379354/financial_reports/"],
  ["APOWA-Finacial-Report-Apr-2019.pdf", "https://res.cloudinary.com/ajanthaprime/image/upload/v1573379354/financial_reports/"],
  ["APOWA-Finacial-Report-May-2019.pdf", "https://res.cloudinary.com/ajanthaprime/image/upload/v1573379355/financial_reports/"],
  ["APOWA-Finacial-Report-Jun-2019.pdf", "https://res.cloudinary.com/ajanthaprime/image/upload/v1573379354/financial_reports/"],
  ["APOWA-Finacial-Report-Jul-2019.pdf", "https://res.cloudinary.com/ajanthaprime/image/upload/v1573379354/financial_reports/"],
  ["APOWA-Finacial-Report-Aug-2019.pdf", "https://res.cloudinary.com/ajanthaprime/image/upload/v1573379354/financial_reports/"],
  ["APOWA-Finacial-Report-Sep-2019.pdf", "https://res.cloudinary.com/ajanthaprime/image/upload/v1573379355/financial_reports/"]
]