require 'spec_helper'

describe AwesomeSpawn::CommandResultError do
  context "basic false command" do
    before { enable_spawning }
    subject do
      begin
        AwesomeSpawn.run!("false")
      rescue => e
        return e
      end
    end

    it { expect(subject.message).to eq("false exit code: 1") }
    it { expect(subject.result).to be_a_failure }
  end

  it ".default_message" do
    expect(described_class.default_message("some message", 123)).to eq "some message exit code: 123"
  end
end
