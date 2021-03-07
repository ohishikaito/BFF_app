require 'rails_helper'

RSpec.describe Api::PostsController, type: :request do
  describe '#index' do
    it 'レスポンスで200 & status:okを返すこと' do
      get '/api/posts#index'
      expect(response.status).to eq 200
      # 他にも色々記述あるけど、status 200がシンプルで分かりやすい気がする。メソッドに影響受けないし。:okで判別もちょっと有りかも！
      # expect(response).to have_http_status 200
      # expect(response).to have_http_status(:ok)
    end
  end

  describe '#show' do
    let(:post) { create(:post) }
    let(:user) { create(:user) }
    let(:auth_token) { user.create_new_auth_token }
    let(:res) { JSON.parse(response.body) }
    let(:send_request) { get "/api/posts/#{post.id}", headers: auth_token }

    context '成功' do
      it 'ログインしていればok' do
        send_request
        expect(response.status).to eq 200
      end

      it '作成したpostが取得できていること' do
        send_request
        expect(res['id']).to eq post.id
      end
    end

    context '失敗' do
      it '非ログイン時は401エラーが返されること' do
        get "/api/posts/#{post.id}"
        expect(response.status).to eq 401
      end
    end
  end

  describe '#create' do
    context '成功' do
      let(:user) { create(:user) }
      let(:auth_token) { user.create_new_auth_token }
      let(:params) { build(:post) }
      let(:send_request) { post "/api/posts", params: params.as_json, headers: auth_token }

      it '成功したらstatus 201を返すこと' do
        send_request
        expect(response.status).to eq 201
      end

      it 'user.postsの数が1増えること' do
        # 一番分かりやすいのってPost.allのcountが1増えたじゃない？
        expect { send_request }.to change(Post.all, :count).by(1)
        # expect { send_request }.to change(user.posts, :count).by(1)
        # expect { send_request }.to change(Post.all, :count).from(0).to(1)
      end
    end

    context '失敗' do
      it '非ログイン時は401エラーが返されること' do
        post "/api/posts"
        expect(response.status).to eq 401
      end
    end
  end

  describe '#update' do
    context '成功' do
      let(:user) { create(:user) }
      let(:auth_token) { user.create_new_auth_token }
      let(:params) { build(:post) }
      let(:send_request) { post "/api/posts", params: params.as_json, headers: auth_token }

      it '成功したらstatus 201を返すこと' do
        send_request
        expect(response.status).to eq 201
      end

      it 'user.postsの数が1増えること' do
        # 一番分かりやすいのってPost.allのcountが1増えたじゃない？
        expect { send_request }.to change(Post.all, :count).by(1)
        # expect { send_request }.to change(user.posts, :count).by(1)
        # expect { send_request }.to change(Post.all, :count).from(0).to(1)
      end
    end

    context '失敗' do
      it '非ログイン時は401エラーが返されること' do
        post "/api/posts"
        expect(response.status).to eq 401
      end
    end
  end
end
