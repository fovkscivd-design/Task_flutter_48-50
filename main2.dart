class Account {
  String accountNumber;
  String ownerName;
  double balance;

  Account(this.accountNumber, this.ownerName, this.balance);

  void charge(double amount) {
    if (amount > 0) {
      balance += amount;
      print('Charged $amount. New balance: $balance');
    } else {
      print('Invalid charge amount.');
    }
  }

  void withdraw(double amount) {
    if (amount <= 0) {
      print('Invalid withdrawal amount.');
    } else if (amount > balance) {
      print('Insufficient balance.');
    } else {
      balance -= amount;
      print('Withdrew $amount. New balance: $balance');
    }
  }

  void printDetails() {
    print('--- Account Details ---');
    print('Account Number: $accountNumber');
    print('Owner Name: $ownerName');
    print('Balance: $balance');
    print('');
  }
}

class NationalBankATM extends Account {
  NationalBankATM(String accountNumber, String ownerName, double balance)
    : super(accountNumber, ownerName, balance);

  @override
  void printDetails() {
    print('--- National Bank ATM ---');
    super.printDetails();
  }
}

class InternationalBankATM extends Account {
  double withdrawFee = 5.0;

  InternationalBankATM(String accountNumber, String ownerName, double balance)
    : super(accountNumber, ownerName, balance);

  @override
  void withdraw(double amount) {
    double totalAmount = amount + withdrawFee;
    if (totalAmount > balance) {
      print('Insufficient balance (includes \$$withdrawFee fee).');
    } else {
      balance -= totalAmount;
      print('Withdrew $amount (+ \$$withdrawFee fee). New balance: $balance');
    }
  }

  @override
  void printDetails() {
    print('--- International Bank ATM ---');
    super.printDetails();
  }
}

void main() {
  NationalBankATM account1 = NationalBankATM('1001', 'Ahmed', 500);
  account1.charge(200);
  account1.withdraw(100);
  account1.printDetails();

  InternationalBankATM account2 = InternationalBankATM('2002', 'Sara', 1000);
  account2.charge(300);
  account2.withdraw(150);
  account2.printDetails();
}
