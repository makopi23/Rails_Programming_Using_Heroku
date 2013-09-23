# coding: utf-8

class MemoController < ApplicationController
  layout "mylayouts"
  def index
    @title = "this is Index Page."
    @msg = "please type new record data."
    if request.post? then
      @memo = Memo.new(
          :sample_id => params['sample_id'],
          :title => params['title'],
          :comment => params['comment']
        )
      @flg = @memo.save
    end
    @datas = Memo.where("id > 0").order("id ASC")
  end
end
