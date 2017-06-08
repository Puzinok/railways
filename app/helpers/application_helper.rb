module ApplicationHelper
  BULMA_FLASH_MSG = {
    success: 'is-success',
    error: 'is-danger',
    alert: 'is-warning',
    notice: 'is-info'
  }.freeze

  def bulma_class_for(flash_type)
    BULMA_FLASH_MSG.fetch(flash_type.to_sym, flash_type.to_s)
  end
end
