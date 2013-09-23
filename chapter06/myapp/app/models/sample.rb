#coding: utf-8

class Sample < ActiveRecord::Base
  attr_accessible :age, :mail, :name, :tel
  has_many :memo
  
  validates :name,
    :presence => true
  validates :age,
    :numericality => { :only_integer => true }
  validates :mail,
    :presence => true
end
