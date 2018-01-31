class Product < ActiveRecord::Base
  include Redmine::SafeAttributes
  unloadable
  validates :name, :issue_id, presence: true
  validates :name, uniqueness: true

  safe_attributes 'name',
                  'cost',
                  'homepage',
                  'issue_id',
                  'date_production',
                  'quantity'

end
