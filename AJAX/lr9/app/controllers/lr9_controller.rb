# frozen_string_literal: true

class Lr9Controller < ApplicationController
  def input
    render layout: false
  end

  def view
    n = params[:val].to_i
    @correct_input = 'true'
    a = []
    n.times do |x|
      a.push(Array.new([x, x.to_s(2)])) if x.to_s == x.to_s.reverse! && x.to_s(2) == x.to_s(2).reverse!
    end
    @res = a

    respond_to do |format|
      format.html
      format.json do
        render json:
          { correct: @correct_input, value: @res }
      end
    end
  end
end
