require 'spec_helper'

describe SecureRandom do
  it 'has a version number' do
    expect(SecureRandom::VERSION).not_to be nil
  end

  describe 'gen_random' do
    subject { SecureRandom.gen_random(num) }
    context 'num == 32' do
      let (:num){ 32 }
      it { should be_an(String) }
      it { expect(subject.bytesize).to eq(num) }
      it { expect(subject.encoding).to eq(Encoding::ASCII_8BIT) }
    end
    context 'num == 1' do
      let (:num){ 1 }
      it { should be_an(String) }
      it { expect(subject.bytesize).to eq(num) }
      it { expect(subject.encoding).to eq(Encoding::ASCII_8BIT) }
    end
    context 'num == 0' do
      let (:num){ 0 }
      it { should be_an(String) }
      it { expect(subject.bytesize).to eq(0) }
      it { expect(subject.encoding).to eq(Encoding::ASCII_8BIT) }
    end
    context 'num < 0' do
      let (:num){ -1 }
      it { expect{subject}.to raise_error(ArgumentError) }
    end
  end
end
