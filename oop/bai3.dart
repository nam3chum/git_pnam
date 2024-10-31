//Tạo lớp BankAccount có các thuộc tính:
//
// accountNumber: số tài khoản.
// balance: số dư trong tài khoản.
// Yêu cầu:
//
// Tạo phương thức deposit(amount) để nạp tiền vào tài khoản.
// Tạo phương thức withdraw(amount) để rút tiền từ tài khoản (số dư không được âm).
// Tạo phương thức getBalance() để lấy số dư hiện tại.
// Viết chương trình:
//
// Tạo một tài khoản ngân hàng với số tài khoản bất kỳ và số dư ban đầu.
// Nạp tiền và rút tiền từ tài khoản.
// In ra số dư sau mỗi lần giao dịch.

class BankAccount {
  String accountNumber;
  double balance;

  BankAccount(this.accountNumber, this.balance); // Constructor
  void deposit(double amount) {
    balance += amount;
    print('số tiền nạp vào : $amount, số du mới: $balance');
  }
  void withdraw(double amount) {
    if (amount <= balance) {
      balance -= amount;
      print(' số tiền rút ra: $amount, số dư mới: $balance');
    } else {
      print('tài khoản bị âm');
    }
  }

  double getBalance() {
    return balance;
  }
}

void main() {
  var account = BankAccount('123456', 1000.0);

  account.deposit(500.0);
  account.withdraw(200.0);
  print('số dư cuoi: ${account.getBalance()}');
}
