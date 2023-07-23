require "rails_helper"

module ServiceObjectSpec
  class DummyClass < ServiceObject
  end

  class DummyClass2 < ServiceObject
    private

    def process
    end
  end

  class DummyClass3 < ServiceObject
    private

    def process
      failed("limit_exceeded")
    end
  end
end

describe ServiceObject do
  it "raises error" do
    service = ServiceObjectSpec::DummyClass.new.call
    expect([service.error_text, service.success?]).to eq ["[ServiceObjectSpec::DummyClass] NotImplementedError", false]
  end

  it "does not raise error" do
    service = ServiceObjectSpec::DummyClass2.new.call
    expect([service.error_text, service.success?]).to eq [nil, true]
  end

  it "can fail during process" do
    service = ServiceObjectSpec::DummyClass3.new.call
    expect([service.error_text, service.success?]).to eq ["limit_exceeded", false]
  end
end
