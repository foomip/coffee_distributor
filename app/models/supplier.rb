class Supplier < ApplicationRecord
  has_many :coffee_bean_supplier_links
  has_many :coffee_beans, through: :coffee_bean_supplier_links

  validates_uniqueness_of :name
end
