# coding: UTF-8
class FigureController < ApplicationController
  def index
  end
  def search
    @tinami = session[:tinami]
    #木を作ってあげる('調べたいタグ',最大深さ)
    @tree = @tinami.create_tree_from_tag('中野梓',1)
  end
  def login
    if params[:mail]
      @tinami = EXTinami.new({
        'api_key' => '4e9455257c4b0',
        'email' => params[:mail],
        'password' => params[:pass]
      })
      @tinami.auth
      session[:tinami] = @tinami
    end
  end
end
