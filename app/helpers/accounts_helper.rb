module AccountsHelper
  def month_year_list
    list = []
    months = Date::ABBR_MONTHNAMES
    (2019..Date.today.year).to_a.each do |year|
      months[1..-1].each do |month|
        if year < Date.today.year || (year == Date.today.year && months.index(month) <= Date.today.month)
          list << (month + '-' + year.to_s)
        end
      end
    end
    list
  end
end
