class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::ConnectionNotEstablished, with: :handle_database_connection_error
  rescue_from PG::ConnectionBad, with: :handle_database_connection_error
  rescue_from ActiveRecord::StatementInvalid, with: :handle_database_connection_error

  private

  def handle_database_connection_error(exception)
    # Логирование ошибки (опционально)
    Rails.logger.error "Database connection error: #{exception.message}"

    # Отображение кастомного сообщения об ошибке
    render "errors/database_error", status: :service_unavailable
  end
end
