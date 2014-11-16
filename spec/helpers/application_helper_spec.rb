require 'rails_helper'

describe ApplicationHelper do
  describe "#alert_class_for" do
    it { expect(alert_class_for(:success)).to eql('alert-success') }

    it { expect(alert_class_for(:error)).to eql('alert-danger') }

    it { expect(alert_class_for(:alert)).to eql('alert-warning') }

    it { expect(alert_class_for(:notice)).to eql('alert-info') }

    it { expect(alert_class_for(:unknown)).to eql('alert-unknown') }
  end
end
