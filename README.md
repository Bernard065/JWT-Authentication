# README

## AuthenticationController

The `authenticate` method is responsible for handling user authentication. It takes the email and password as parameters from the request and tries to find a user with the provided email using `User.find_by(email: params[:email])`.

If a user with the given email is found, it checks if the provided password matches the user's password using `user&.authenticate(params[:password])`. The `authenticate` method is provided by `has_secure_password` in the `User` model.

If the user authentication is successful, it generates a JWT token using the `generate_token` private method and the user's ID a the payload. The token is then returned in the JSON response: `render json: { token: token }`.

If the authentication fails, it returns an error message and sets the HTTP status to `:unauthorized`.


## ApplicationController

The `before_action` filter `authenticate_request` is called before any action in the controller. It ensures that the request is authenticated before proceeding further.

Inside `authenticate_request`, the value of the `Authorization` header is extracted from the request headers.

The token is obtained by splitting the header value on the space character and retrieving the last part.

If a token is present, it is decoded using `JWT.decode` with the secrete key obtained from `Rails.application.secrets.secret_key_base`.

If the decoding is successful, the `@current_user` is set by finding the user with the decoded `user_id`.

If there is any error during decoding, such as an invalid token, a `JWT::DecodeError` is rescued and an appropriate JSON response is returned.

If the authentication is unsuccessful (no token or user not found), a JSON response with an "Unauthorized" error message and a status of `:unauthorized` is returned.# JWT-Authentication
