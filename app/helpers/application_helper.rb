module ApplicationHelper
  def page_title
    if @page_title
      title = "メルカリ" + " - " + @page_title
    else
      title = "メルカリ" + " スマホでかんたん フリマアプリ"
    end
    title
  end
end
