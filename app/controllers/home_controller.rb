class HomeController < ApplicationController
    #トップアクション
  before_action :forbid_login_user,{only: [:top]}

  def top
  end
  
  #サービスページのアクション
  def about
  end
end
