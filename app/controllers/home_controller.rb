class HomeController < ApplicationController
  before_action :js_authenticate_user!, only: [:like_movie]
  before_action :authenticate_user! 
  def index
    @products = Product.all
    @p = Product.first
    @home = Home.all
    session[:product_id] = params[:product_id].to_i
    a =session[:product_id]
    @like = Like.where(user_id: current_user.id, product_id: a).first if user_signed_in?
    p @like
    p session[:product_id]
    p current_user.id
  end

  def like_product
    #현재 유저와 params에 담긴 movie간의 좋아요 관계를 설정한다.
   b=session[:product_id].to_i
    @like = Like.where(user_id: current_user.id,product_id: b).first
    if @like.nil?
       @like=Like.create(user_id: current_user.id,product_id: b)
       p "신고버튼 눌름"
    else
        @like.destroy
        p "신고버튼 풀림"
    #만약에 현재 로그인한 유저가 이미 좋아요를 눌렀을 경우
    #해당 Like 인스턴스 삭제
    end
  end
end
