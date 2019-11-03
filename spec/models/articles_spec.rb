# require 'rails_helper'

# RSpec.describe Article, type: :model do
#   describe '#create' do
#     context 'can save' do
#       it 'is valid with content' do
#         expect(build(:article, image: nil)).to be_valid
#       end

#       it 'is valid with image' do
#         expect(build(:article, content: nil)).to be_valid
#       end

#       it 'is valid with content and image' do
#         expect(build(:article)).to be_valid
#       end
#     end

#     context 'can not save' do
#       it 'is invalid without content and image' do
#         article = build(:article, content: nil, image: nil)
#         article.valid?
#         expect(article.errors[:content]).to include('を入力してください')
#       end

#       it 'is invalid without group_id' do
#         article = build(:article, group_id: nil)
#         article.valid?
#         expect(message.errors[:group]).to include('を入力してください')
#       end

#       it 'is invaid without user_id' do
#         article = build(:article, user_id: nil)
#         article.valid?
#         expect(article.errors[:user]).to include('を入力してください')
#       end
#     end
#   end
# end