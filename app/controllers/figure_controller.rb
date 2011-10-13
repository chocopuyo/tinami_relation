# coding: UTF-8
class FigureController < ApplicationController
  def index
    if params[:mail]
      @tinami = EXTinami.new({
        'api_key' => '4e9455257c4b0',
        'email' => params[:mail],
        'password' => params[:pass]
      })
      @tinami.auth
    end
  end
  def search
#      print tinami.creator_info(6789)
    tags = @tinami.relation_search_tags('中野梓')['tag']
#    puts '中野梓' 
#    puts tinami.relation_search_tags('中野梓')['creator'].xpath("//name")[0].content
#    puts ''
    #検索結果を表示するためのインスタンス変数
    @result = Array.new 
    def for_search(tags,tinami,depth)
#      puts depth
      tags.each do |t| 
        #tinami.relation_search_tags('中野梓')
        tags = @tinami.relation_search_tags(t)['tag']
        puts t
        @result.push @tinami.relation_search_tags(t)['creator'].xpath("//name")[0].content
        puts ''
        if depth<2
          for_search(tags,@tinami,depth+=1)
        end 
      end 
    end
    for_search(tags,@tinami,0)
  end
  def login
  end
end
