# frozen_string_literal: true

# class NumberController
class NumberController < ApplicationController
  def input; end

  def calculate_list
    n = params[:n].to_i
    a = []
    n.times do |x|
      a.push(Array.new([x, x.to_s(2)])) if x.to_s == x.to_s.reverse! && x.to_s(2) == x.to_s(2).reverse!
    end
    @result = a
    render xml: @result
  end
end
