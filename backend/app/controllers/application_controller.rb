class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
# curl localhost:3004/api/auth -X POST -H 'Content-Type: application/json' -d '{"email": "test@example.com", "password": "password", "name": "hoge"}' {"status":"success","data":{"uid":"test@example.com","email":"test@example.com","provider":"email","name":"hoge","created_at":"2020-09-08T04:51:42.527Z","updated_at":"2020-09-08T04:51:42.698Z"}}

# curl localhost:3004/api/auth/sign_in -X POST -H 'Content-Type: application/json' -d '{"email": "test@example.com", "password": "password"}' -i HTTP/1.1 200 OK X-Frame-Options: SAMEORIGIN X-XSS-Protection: 1; mode=block X-Content-Type-Options: nosniff X-Download-Options: noopen X-Permitted-Cross-Domain-Policies: none Referrer-Policy: strict-origin-when-cross-origin Content-Type: application/json; charset=utf-8 access-token: T4ZeomARybw3_o5nIHQAfw token-type: Bearer client: Fj772-EYBPnvJdETYhObyQ expiry: 1600751367 uid: test@example.com ETag: W/"8c41022d2e42ca28df0cb958a84ab2f4" Cache-Control: max-age=0, private, must-revalidate X-Request-Id: d4ff732c-f6b5-4213-8984-5d9457b39cbd X-Runtime: 0.510436 Transfer-Encoding: chunked
# curl localhost:3004/api/auth/sign_in -X POST -H 'Content-Type: application/json' -d '{"email": "test@example.com", "password": "password"}' -i HTTP/1.1 401 Unauthorized X-Frame-Options: SAMEORIGIN X-XSS-Protection: 1; mode=block X-Content-Type-Options: nosniff X-Download-Options: noopen X-Permitted-Cross-Domain-Policies: none Referrer-Policy: strict-origin-when-cross-origin Content-Type: application/json; charset=utf-8 token-type: Bearer client: Fj772-EYBPnvJdETYhObyQ expiry: 1600751367 uid: test@example.com ETag: W/"8c41022d2e42ca28df0cb958a84ab2f4" Cache-Control: max-age=0, private, must-revalidate X-Request-Id: d4ff732c-f6b5-4213-8984-5d9457b39cbd X-Runtime: 0.510436 Transfer-Encoding: chunked