class Memo < ActiveRecord::Base
  attr_accessible :comment, :sample_id, :title
  #belongs_to :sample
end
