# coding: utf-8

class SampleController < ApplicationController
  layout "mylayouts"
  
  def index
    if request.post? then
      obj = Sample.new(
        :name => params['name'],
        :age => params['age'].to_i,
        :mail => params['mail'],
        :tel => params['tel']
      )
      obj.save
    end
    
    @title = "this is Index Page."
    @datas = Sample.all
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
      arr = params[:fstr].split(',')
      @datas = Sample.find(arr)
    end
  end
end
