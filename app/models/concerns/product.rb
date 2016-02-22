class Product
  attr_accessor :pid, :item, :description, :price, :condition, :dimension_w,
                :dimension_l, :dimension_h, :img_file, :quantity, :category

  def discount_price
      if self.condition == "good"
        self.price = "#{formatted_number(self.price.to_f * 0.9)} after 10% discount"
      elsif self.condition == "average"
        self.price = "#{formatted_number(self.price.to_f * 0.8)} after 20% discount"
      else
        self.price = formatted_number(self.price.to_f * 1.0)
      end
    self.price
  end

  def formatted_number(n)
    a,b = sprintf("%0.2f", n).split('.')
    a.gsub!(/(\d)(?=(\d{3})+(?!\d))/, '\\1,')
    "$#{a}.#{b}"
  end

end
