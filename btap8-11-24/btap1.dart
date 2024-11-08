
import 'dart:math';
//bài toán coin change
int coinChange(List<int> coins, int amount) {
  List<int> dp = List.filled(amount + 1, amount + 1);
  dp[0] = 0;
  for (int i = 1; i <= amount; i++) {
    for (int coin in coins) {
      if (coin <= i) {
        dp[i] = min(dp[i], dp[i-coin] + 1);
      }
    }
  }
  return dp[amount] > amount ? -1 : dp[amount];
}
void main(){
  List<int> a =[1,2,3,5,6,7,8,9];
  int num= coinChange(a, 13);
  print(num);

}