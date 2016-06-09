module OrdersHelper
  def info_label
    '<span class="glyphicon glyphicon-info-sign icon_info" aria-hidden="true"></span>'.html_safe
  end

  def trash_label
    '<span class="glyphicon glyphicon-trash remove_item" aria-hidden="true"></span>'.html_safe
  end
end
