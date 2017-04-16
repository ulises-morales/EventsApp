class User < ApplicationRecord
  has_secure_password

  def new
    # render layout: "two_column"
    # render json: us_states
  end

  def edit
    
  end

end
