require 'account'

describe Account do
    it "returns an empty array when nothing has been entered" do
        account = Account.new
        expect(account.get_all_transactions).to eq([])
    end

    it "returns an array when a deposit has been made" do
        account = Account.new
        account.deposit(100)
        first = account.instance_variable_get(:@transactions).first
        expect(first).to include(:credit => 100, :debit => nil, :balance => 100)

    end

    it "returns an array when a withdraw has been made" do
        account = Account.new
        account.deposit(1000)
        account.withdraw(100)
        second = account.instance_variable_get(:@transactions)[1]
        expect(second).to include(:credit => nil, :debit => 100, :balance => 900)
    end

    it "returns an error when a withdraw is made without enough funds" do
        account = Account.new
        account.deposit(100)
        expect{account.withdraw(200)}.to raise_error(ArgumentError, 'Not enough money')
    end
end