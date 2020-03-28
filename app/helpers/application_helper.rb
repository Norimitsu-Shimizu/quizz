module ApplicationHelper
  def year_month_day(date)
    date.strftime("%Y年%m月%d日(#{%w(日 月 火 水 木 金 土)[date.wday]})")
  end
end
