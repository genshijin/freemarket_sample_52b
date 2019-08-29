module ApplicationHelper
  def page_title
    if @page_title
      title = @page_title + " - " + "メルカリ スマホでかんたん フリマアプリ"
    else
      title = "メルカリ" + " スマホでかんたん フリマアプリ"
    end
    title
  end
end
