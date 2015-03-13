class Api::VariantSerializer < ActiveModel::Serializer
  attributes :id, :is_master, :count_on_hand, :name_to_display, :unit_to_display, 
    :options_text, :on_demand, :price, :fees, :price_with_fees, :product_name

  def price_with_fees
    object.price_with_fees(options[:current_distributor], options[:current_order_cycle])
  end

  def price
    object.price
  end

  def fees
    object.fees_by_type_for(options[:current_distributor], options[:current_order_cycle])
  end

  def product_name
    object.product.name
  end

end
