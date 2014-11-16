module ApplicationHelper
  def alert_class_for(flash_type)
    "alert-#{{ success: 'success', error: 'danger', alert: 'warning', notice: 'info' }.fetch(flash_type.to_sym, flash_type)}"
  end
end
