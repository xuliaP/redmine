class RedmineWarehouseHookListener < Redmine::Hook::ViewListener
  render_on :view_issues_sidebar_issues_bottom, partial: 'redmine_warehouse/add_products'
  render_on :view_issues_show_details_bottom, partial: 'redmine_warehouse/show_warehouse_issue'

end
