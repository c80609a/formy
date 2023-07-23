# frozen_string_literal: true

module Adapters
  class Telegram
    include HTTParty

    delegate :post, to: :class

    base_uri("https://api.telegram.org/bot#{ENV['TELEGRAM_BOT_TOKEN']}")

    def initialize
      self.class.headers("Content-Type" => "application/json;charset=utf-8")
    end

    # @param [Hash] payload {chat_id, message}
    def notify_bot(payload)
      post("/sendMessage", body: payload.to_json)
    end
  end
end
