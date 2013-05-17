helpers do

  def logged_in?
    if current_user != nil
      return true
    end
  end
end

