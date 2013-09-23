# coding: utf-8

class SampleController < ApplicationController
  layout "mylayouts"
  
  def index
    @title = "this is Index Page."
    @msg = "新しいレコードを追加できます。"
    
    if request.post? then
      @sample = Sample.new(
        :name => params['name'],
        :age => params['age'],
        :mail => params['mail'],
        :tel => params['tel']
      )
      
      @flg = !@sample.save
      
      # if obj.save then
        # @msg = "保存しました。"
      # else
        # @msg = "VALIDATE ERROR."
      # end
    end
    
    
    @datas = Sample.where("id > 0").order("name ASC")
    #@datas = Sample.all
  end

  def show
    @title = "Show ID = " + params[:id]
    @result = Sample.find(params[:id])
  end
  
  def delete
    obj = Sample.find(params[:id])
    obj.destroy
    redirect_to :action => "index"
  end
  
  def update
    @result = Sample.find(params[:id])
    if request.post? then
      @result.name = params['name']
      @result.age = params['age']
      @result.mail = params['mail']
      @result.tel = params['tel']
      @result.save
      redirect_to :action => "index"
    else
      @title = "Update ID=" + params[:id]
    end
  end
  
  def find
    @title = "Find Record"
    @datas = []
    if request.post? then
      # arr = params[:fstr].split(',')
      #@datas = Sample.find(arr)
      
      fstr = params[:fstr]
      #@datas = Sample.where(:name => fstr)
      #@datas = Sample.where("name like '%" + fstr + "%'")
      @datas = Sample.where("age >= ?",fstr)
    end
  end
end
