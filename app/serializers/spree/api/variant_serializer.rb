class Spree::Api::VariantSerializer < ActiveModel::Serializer
  attributes :id, :options_text, :unit_value, :unit_description, :on_demand, :display_as, :display_name
  attributes :on_hand, :price, :tagged_enterprise_id

  def on_hand
    object.on_hand.nil? ? 0 : ( object.on_hand.to_f.finite? ? object.on_hand : "On demand" )
  end

  def price
    # Decimals are passed to json as strings, we need to run parseFloat.toFixed(2) on the client side.
    object.price.nil? ? 0.to_f : object.price
  end
end
