
require_relative 'transactions'

class Account
    attr_reader :balance
  
    def initialize
      @balance = 0
      @transactions = []
    end
  
    def deposit(amount)
      @balance += amount
      transaction = Transaction.new(Time.now, amount, nil, @balance)
      @transactions << transaction
      transaction
    end
  
    def withdraw(amount)
        if amount > @balance; raise ArgumentError, 'Not enough money'; end
  
      @balance -= amount
      transaction = Transaction.new(Time.now, nil, amount, @balance)
      @transactions << transaction
      transaction
    end
  
    def statement
        statement = "date || credit || debit || balance\n"
        @transactions.reverse_each do |transaction|
          credit = transaction.credit ? '%.2f' % transaction.credit : ''
          debit = transaction.debit ? '%.2f' % transaction.debit : ''
          statement += "#{transaction.date.strftime("%d/%m/%Y")} || #{credit} || #{debit} || #{'%.2f' % transaction.balance}\n"
        end
        statement
    end
      
end
  
account = Account.new
account.deposit(1000)
account.deposit(2000)
account.withdraw(500)
  
puts account.statement
  
  
# class Account
#     def initialize
#         @balance = 0
#         @transactions = []
#     end

#     def print_statement
#         puts "date || credit || debit || balance"
#         puts @transactions.reverse
#     end

#     def get_all_transactions
#         return @transactions
#     end

#     def deposit(amount)
#         @balance += amount
#         @transactions << { date: Time.now, credit: amount, debit: nil, balance: @balance }
#         return @transactions
#     end

#     def withdraw(amount)
#         if amount > @balance; raise ArgumentError, 'Not enough money'; end

#         @balance -= amount
#         @transactions << { date: Time.now, credit: nil, debit: amount, balance: @balance }
#         return @transactions
#     end
# end

# account = Account.new
# account.deposit(1000)
# account.withdraw(500)
# account.print_statement