# rspec constructs

# constructor(value).method(constructor(value).optional.adjustments)
# method(:symbol) { block_argument }
# method(string) { block_argument }
# method(name, options_hash)

RSpec.describe Robot do
  describe "#sentient?" do
    let(:cores) { 32 }
    let(:robot) do
      Robot.new(cores)
    end

    context "with sentience module installed" do
      before(:each) { allow(SentienceModule).to receive(:installed?).and_return(true) }

      context "with enough computational cores" do
        let(:cores) { 24 }

        it "is capable of sentient thought" do
          expect(robot).to be_sentient
        end
      end

      context "without enough computational cores" do
        let(:cores) { 23 }

        it "is incapable of sentient thought" do
          result = robot.sentient?

          expect(result).not_to eq(true)
        end
      end
    end

    context "without a sentience module" do
      before { allow(SentienceModule).to receive(:installed?).and_return(false) }

      subject { robot.sentient? }

      it "is incapable of sentient thought" do
        is_expected.not_to be_truthy
      end
    end
  end
end

SentienceModule = Struct.new do
  def installed?
    false
  end
end

Robot = Struct.new(:cores) do
  def sentient?
    cores >= 24 && SentienceModule.installed?
  end
end
