class InvoiceItem < ApplicationRecord
  validates :unit_price, presence: true

  belongs_to :invoice
  belongs_to :item
end