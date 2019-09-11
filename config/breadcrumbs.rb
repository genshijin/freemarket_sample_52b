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

crumb :logout do
  link "ログアウト", logout_mypage_path
  parent :mypage
end

# パンくずリスト 商品ページ非表示テスト
crumb :items do
  link "テスト商品", items_path
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