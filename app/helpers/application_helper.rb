module ApplicationHelper
  def page_title
    title = "メルカリ"
    if @page_title
      title = title + " - " + @page_title
    else
      title = title + " スマホでかんたん フリマアプリ"
    end
    title
  end
end
