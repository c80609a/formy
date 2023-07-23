# frozen_string_literal: true

class ServiceObject
  attr_reader :error_text

  def initialize
    @success = true
    @error_text = nil
  end

  def call(*_args)
    begin
      process
    rescue StandardError, NotImplementedError => e
      failed "[#{self.class}] #{e.message}"

      Rails.logger.warn "\n\t#{@error_text}"
      Rails.logger.warn "\n\e[35m\t#{e.backtrace[0..20] * "\n\t"} \e[0m"

      custom_error_handler e
    end
    self
  end

  def success?
    @success
  end

  private

  def process
    raise NotImplementedError
  end

  def custom_error_handler(_error)
  end

  def failed(error_text)
    @error_text = error_text
    @success = false
  end
end
