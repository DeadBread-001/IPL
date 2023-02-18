# frozen_string_literal: true

# module CalcHelper
module CalcHelper
  def calc_automorf(nnn)
    nnn = nnn.to_i
    a = []
    nnn.times do |x|
      a.push(Array.new([x, x.to_s(2)])) if x.to_s == x.to_s.reverse! && x.to_s(2) == x.to_s(2).reverse!
    end
    a
  end
end
