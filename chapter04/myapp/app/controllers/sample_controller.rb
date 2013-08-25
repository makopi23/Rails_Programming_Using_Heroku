# coding: utf-8

class SampleController < ApplicationController
  #layout "mylayouts"
  
  def index
    title = "this is Index Page..."
    
    
=begin
    #msg = "<html><body><h1>Hello</h1><p>this is a sample!</p></body></html>"
    msg = '<html><body><h1>Welcome</h1><p>this is Index!</p>
     <a href="/sample/helo">go helo</a>
     </body></html>'
    render :text => msg
=end
    time = Time.now
    @str = time.strftime("%Y年 %m月 %d日 %H時 %M分 %S秒")
    

    
    if request.post? then
      @msg = "you type: " + params['text1']
    else
      @msg = "何か書いてください。"
    end
    
    if params['msg'] == nil then
      #@msg = "パラメータはありません。"
    else
      @msg = "parameter: " + params['msg']
    end
    
    datas = [
=begin
      "こんにちは。",
      "これはサンプルのデータです。",
      "さようなら。"
=end
      {:name => "Taro", :tel => "03-555-5555", :mail => "taro@yamada"},
      {:name => "Hanako", :tel => "03-777-7777", :mail => "hanako@flower"},
      {:name => "makopi233", :tel => "03-999-9999", :mail => "makopi23@makopi"}
    ]
    
    render :layout => "mylayouts", :locals => {:title => title, :datas => datas}
  end
  
  def helo
    redirect_to :action => "index", :params => {'msg' => "redirect now!"}
    # msg = "<html><body><h1>Hello</h1><p>this is helo action!</p></body></html>"
    # render :text => msg
  end
  
end
