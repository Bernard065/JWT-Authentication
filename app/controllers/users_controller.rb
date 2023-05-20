
class UsersController < ApplicationController
  before_action :authenticate_request, only: [:index, :show, :update, :destroy]

  # ...
end
