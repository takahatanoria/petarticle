# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create(:name => '散歩・おでかけ')
Category.create(:name => 'しつけ')
Category.create(:name => '怪我・病気・予防・介護')
Category.create(:name => 'くらし・生活・日常')
Category.create(:name => 'エサ・食事')
Category.create(:name => 'ケア・飼育方法')
Category.create(:name => 'Q & A')
Category.create(:name => '成功談・失敗談')
Category.create(:name => 'ペットロス')
Category.create(:name => 'その他')