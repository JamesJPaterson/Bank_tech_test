require 'transactions'

describe Transaction do
  let(:date) { Time.now }
  let(:credit) { 1000 }
  let(:debit) { nil }
  let(:balance) { 1000 }

  subject { described_class.new(date, credit, debit, balance) }

  describe '#date' do
    it 'returns the transaction date' do
      expect(subject.date).to eq(date)
    end
  end

  describe '#credit' do
    it 'returns the transaction credit amount' do
      expect(subject.credit).to eq(credit)
    end
  end

  describe '#debit' do
    it 'returns the transaction debit amount' do
      expect(subject.debit).to eq(debit)
    end
  end

  describe '#balance' do
    it 'returns the account balance after the transaction' do
      expect(subject.balance).to eq(balance)
    end
  end
end
