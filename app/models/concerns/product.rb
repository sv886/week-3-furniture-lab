class Product
  attr_accessor :pid, :item, :description, :price, :condition, :dimension_w,
                :dimension_l, :dimension_h, :img_file, :quantity, :category

  def discount_price
      if self.condition == "good"
        self.price = "Discounted Price: #{self.price.to_i * 0.9}"
      elsif self.condition == "average"
        self.price = self.price.to_i * 0.8
      else
        self.price = self.price.to_i * 1.0
      end
    self.price
  end

end
