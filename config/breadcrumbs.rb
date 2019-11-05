crumb :root do
  link "トップ", root_path
end

# user#index
crumb :users do
  link "マイページ", user_path
  parent :root
end

# user#show
crumb :show_user do |user|
  link "マイページ", user_path
  parent :root
end

# user#edit
crumb :edit_user do |user|
  link "Edit #{user.name}", edit_user_path(user)
  parent :show_user, user
end

# user#new
crumb :new_user do
  link "New User", new_user_path
  parent :users
end

