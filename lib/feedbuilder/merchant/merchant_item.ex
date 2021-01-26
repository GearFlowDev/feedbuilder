defmodule Feedbuilder.Merchant.Item do
  @moduledoc """
  Represents a Product for Google Merchant RSS Feed.

  This specification is incomplete - see full spec here:
  https://support.google.com/merchants/answer/7052112?visit_id=637434697219147404-140493451&hl=en&rd=1
  """
  @enforce_keys [:id, :title, :description, :link, :image_link, :availability]
  defstruct [
    :id,
    :title,
    :description,
    :link,
    :image_link,
    :condition,
    :availability,
    :price,
    :gtin,
    :brand,
    :mpn,
    :shipping,
    :product_type,
    :google_product_category,
    :additional_image_link,
    :mobile_link
  ]

  @type condition :: :new | :used | :refurbished
  @type availability :: :in_stock | :out_of_stock | :preorder

  @type t :: %__MODULE__{
          id: String.t(),
          title: String.t(),
          description: String.t(),
          link: String.t(),
          image_link: String.t(),
          condition: condition | nil,
          availability: availability | nil,
          price: String.t(),
          shipping: Feedbuilder.Merchant.Item.Shipping,
          gtin: String.t(),
          brand: String.t(),
          mpn: String.t()
        }
end

defmodule Feedbuilder.Merchant.Item.Shipping do
  @enforce_keys [:country, :service, :price]
  defstruct [:country, :service, :price]

  @type t :: %__MODULE__{
          country: String.t(),
          service: String.t(),
          price: String.t()
        }
end
