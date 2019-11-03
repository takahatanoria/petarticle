# require 'rails_helper'

# describe ArticlesController, type: :controller do

#   describe 'GET #new' do
#     it "renders the :new template" do
#       get :new
#       expect(response).to render_template :new
#     end
#   end

#   describe 'GET #edit' do
#     it "assigns the requested tweet to @tweet" do
#       article = create(:article)
#       get :edit, params: { id: article }
#       expect(response).to render_template :edit
#     end

#     it "renders the :edit template" do
#     end
#   end

#   describe 'GET #index' do
#     it "populates an array of tweets ordered by created_at DESC" do
#       articles = create_list(:article, 3)
#       get :index
#       expect(assigns(:articles)).to match(articles.sort{|a, b| b.created_at <=> a.created_at })
#     end

#     it "renders the :index template" do
#       get :index
#       expect(response).to render_template :index
#     end
#   end
# end
