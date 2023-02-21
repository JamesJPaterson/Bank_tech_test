class Account
    def initialize
        @balance = 0
        @transactions = []
    end

    def print_statement
        puts "date || credit || debit || balance"
        puts @transactions.reverse
    end

    def get_all_transactions
        return @transactions
    end

    def deposit(amount)
        @balance += amount
        @transactions << { date: Time.now, credit: amount, debit: nil, balance: @balance }
        return @transactions
    end

    def withdraw(amount)
        if amount > @balance
          raise ArgumentError, 'Not enough money'
        end

        @balance -= amount
        @transactions << { date: Time.now, credit: nil, debit: amount, balance: @balance }
        return @transactions
    end
end

account = Account.new
account.deposit(1000)
account.deposit(2000)
account.withdraw(500)
account.print_statement