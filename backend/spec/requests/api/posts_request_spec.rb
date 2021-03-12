require 'rails_helper'

RSpec.describe Api::PostsController, type: :request do
  include_context 'setup'

  describe '#index' do
    let!(:post) { create_list(:post, 11) }
    let(:send_request) { get '/api/posts#index' }

    it 'responseでstatus 200を返すこと' do
      send_request
      expect(response.status).to eq 200
    end

    it 'json形式でresponseを返すこと' do
      send_request
      expect(response.content_type).to eq 'application/json; charset=utf-8'
    end

    it 'postを10件ずつ返すこと' do
      send_request
      expect(res['posts'].size).to eq 10
    end
  end

  describe '#create' do
    context '成功' do
      let(:params) { attributes_for(:post, user_id: user.id).as_json }
      let(:send_request) { post "/api/posts", params: params, headers: auth_token }

      it '作成したらstatus 201を返すこと' do
        send_request
        expect(response.status).to eq 201
      end

      it 'Post.allのcountが1増えること' do
        expect { send_request }.to change(Post.all, :count).by(1)
      end
    end

    context 'ログインしているが失敗' do
      describe 'nameがnilだと失敗すること' do
        let(:params) { attributes_for(:post, name: nil, user_id: user.id).as_json }
        let(:send_request) { post "/api/posts", params: params, headers: auth_token }

        it '作成しようとするとstatus 422が返されること' do
          send_request
          expect(response.status).to eq 422
        end

        it '作成に失敗したら、Post.allのcountが変わらないこと' do
          expect { send_request }.to_not change(Post.all, :count)
        end
      end
    end

    context 'ログインしていないので失敗する' do
      let(:params) { attributes_for(:post, user_id: user.id).as_json }
      let(:send_request) { post "/api/posts", params: params }

      it '非ログイン時は401エラーが返されること' do
        send_request
        expect(response.status).to eq 401
      end
    end
  end

  describe '#show' do
    let(:post) { create(:post) }
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

  describe '#update' do
    let(:post) { create(:post, user: user) }
    let(:params) { attributes_for(:post, id: post.id, name: "update_post", user_id: user.id).as_json }
    let(:send_request) { patch "/api/posts/#{post.id}", params: params, headers: auth_token }

    context '成功' do
      it '更新したらstatus 200を返すこと' do
        send_request
        expect(response.status).to eq 200
      end

      it 'nameが更新されてること' do
        send_request
        expect(post.reload.name).to eq "update_post"
      end
    end

    context '失敗' do
      it '非ログイン時は401エラーが返されること' do
        patch "/api/posts/#{post.id}", params: params
        expect(response.status).to eq 401
      end
    end
  end

  describe '#destroy' do
    let!(:post) { create(:post, user: user) }
    let(:send_request) { delete "/api/posts/#{post.id}", headers: auth_token }

    context '成功' do
      it '削除したらstatus 200を返すこと' do
        send_request
        expect(response.status).to eq 200
      end

      it 'postが削除されてること' do
        expect { send_request }.to change(Post.all, :count).by(-1)
      end
    end

    context '失敗' do
      let(:send_request) { delete "/api/posts/#{post.id}" }

      it '非ログイン時は401エラーが返されること' do
        send_request
        expect(response.status).to eq 401
      end

      it '削除に失敗したら、Post.allのcountが変わらないこと' do
        expect { send_request }.to_not change(Post.all, :count)
      end
    end
  end
end
