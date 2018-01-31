Redmine::Plugin.register :redmine_warehouse do
  name 'Redmine Warehouse plugin'
  author 'test'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'

  permission :warehouse, { :products => [:index] }, :public => true
  menu :project_menu, :warehouse, { :controller => 'products', :action => 'index' }, :caption => 'Warehouse',  :param => :id
  require_dependency 'redmine_warehouse_hook_listener'

end
