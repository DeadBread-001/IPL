# frozen_string_literal: true

# class CalcController
class CalcController < ApplicationController
  def input; end

  def view
    num = params.permit(:number)
    @calculator = Calc.new(num)
    @hash = @calculator.result
    flash_info_of_request
  end

  def show_db
    respond_to do |format|
      format.html
      format.xml { render xml: Calc.all }
    end
  end

  def flash_info_of_request
    flash[:notice] = if @calculator.flag
                       'Results were added to db'
                     else
                       'Results were taken from db'
                     end
  end
end
