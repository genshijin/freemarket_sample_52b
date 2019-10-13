crumb :root do
  link "メルカリ", root_path
end

# マイページ
crumb :mypage do
  link "マイページ", mypage_path
  parent :root
end

crumb :profile do
  link "プロフィール", mypage_profile_index_path
  parent :mypage
end

crumb :card do
  link "支払い方法", mypage_cards_path
  parent :mypage
end

crumb :cardcreate do
  link "クレジットカード情報入力", new_mypage_card_path
  parent :card
end

crumb :identification do
  link "本人情報の登録", edit_mypage_path
  parent :mypage
end

crumb :logout do
  link "ログアウト", logout_mypage_path
  parent :mypage
end

# 商品ページ
crumb :items do |item|
  item = Item.find_by(id: params[:id])
  link item.name
  parent :root
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end