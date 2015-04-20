require 'rails_helper'

describe TopicsController do
  render_views
  login_user

  describe 'GET #index' do
    it 'lists topics' do
      hello = create(:topic, title: 'Hello')
      get :index, letter: 'S'
      expect(assigns(:topics)).to match_array([hello])
    end

    it 'renders #index' do
      get :index, letter: 'S'
      expect(response).to render_template :index
    end
  end

  describe 'GET #new' do
    it 'assigns a new topic to @topic' do
      get :new
      expect(assigns(:topic)).to be_a_new(Topic)
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested topic to @topic' do
      topic = create(:topic)
      get :edit, id: topic
      expect(assigns(:topic)).to eq topic
    end

    it 'renders #edit' do
      topic = create(:topic)
      get :edit, :format => "html", id: topic.id
      expect(response).to render_template :edit
    end
  end

  describe 'POST #topic' do
    render_views
    before :each do
      topic = build(:topic)
    end



    context "with valid attributes" do
      it 'saves the topic in the database' do
        expect{
          post :create, topic: attributes_for(:topic)
        }.to change(Topic, :count).by(1)
      end

      it 'redirects to topics#index' do
        post :create, topic: attributes_for(:topic)
        expect(response).to redirect_to '/topics'
      end
    end

    context 'with invalid attributes' do
    	let 
      it 'does not save the new contact in the database' do
        expect{
          post :create, topic: { title: "" }
        }.to_not change(Topic, :count)
      end

      it 're-renders the :new template' do
        post :create, topic: { title: "" }
        expect(response).to render_template :new
      end
    end
  end
end
