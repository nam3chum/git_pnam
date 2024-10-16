//Bài 1: Số Hoàn Hảo
// Một số hoàn hảo là một số nguyên dương bằng tổng các ước của chính nó (trừ bản thân nó).
// Ví dụ: số 6 là một số hoàn hảo vì 1 + 2 + 3 = 6.
// Yêu cầu:
// Viết một hàm kiểm tra xem một số có phải là số hoàn hảo hay không.
// In ra tất cả các số hoàn hảo trong một khoảng cho trimport 'dart:core';

import 'dart:core';

bool checkHoanHao(int a){
  int sum =0;
  for(int i =1;i<a;i++){
    if(a%i==0)
      {
        sum+=i;
      }
  }
  return sum==a;
}

void sohoanhao(){
  int limit = 1000;
  for(int i =1;i<=limit;i++)
    {
      if(checkHoanHao(i)) {
        print('$i là số hoàn hảo');
      }
    }
}
//Bài 2: Đệ Quy Tính Fibonacci Với Bộ Nhớ Cache (Memoization)
// Chuỗi Fibonacci là chuỗi số trong đó mỗi số là tổng của hai số trước đó.
// Viết một hàm để tính số Fibonacci thứ N sử dụng đệ quy và kỹ thuật bộ nhớ cache để tối ưu hóa.
// Yêu cầu:
// Sử dụng đệ quy và bộ nhớ cache để tối ưu hóa việc tính toán chuỗi Fibonacci.
Map<int, int> fibCache= {};
int fibonacci(int n){
  if(n<=1) return n;
  if(fibCache.containsKey(n)) return fibCache[n]!;
  fibCache[n] = fibonacci(n-1) + fibonacci(n-2);
  return fibCache[n]!;
}
//Bài 3: Ma Trận Xoắn Ốc
// Tạo một ma trận kích thước n x n và điền các giá trị từ 1 đến n² theo dạng xoắn ốc
//, bắt đầu từ vị trí (0,0) và di chuyển theo chiều kim đồng hồ.
// Yêu cầu:
// Tạo hàm để xây dựng ma trận xoắn ốc và in ra ma trận.
List<List<int>> matranXoan(int n){
  List<List<int>> matrix = List.generate(n, (_) => List.filled(n, 0));
  int value = 1;
  //tao gioi hạn cho man tran
  int top =0,left=0,bottom = n-1,right= n-1;

  while(value <= n * n){
    for(int i =left;i<=right;i++)
      {
        matrix[top][i] =value++;
      }
    top++;
    for(int i = top;i<=bottom;i++)
      {
        matrix[i][right]=value++;
      }
    right--;
    for(int i = right ; i>=left;i--){
      matrix[bottom][i]=value++;
    }
    bottom--;
    for(int i = bottom;i>=top;i--)
      {
        matrix[i][left]=value++;
      }
    left++;
  }
  return matrix;
}
void printMatrix() {
  List<List<int>> matrix = matranXoan(5);// in ra ma tran 5x5
  for (var row in matrix) {
    print(row);  // In từng hàng của ma trận
  }
}

//Bài 4: Giải Mê Cung (Maze Solver)
// Viết một thuật toán đệ quy để giải mê cung. Mê cung được biểu diễn bằng một ma trận, trong đó:
// 1 đại diện cho đường đi có thể đi.
// 0 đại diện cho tường không thể đi qua.
// Xuất phát từ góc trên bên trái (0,0) và tìm đường tới góc dưới bên phải (n-1, n-1).
// Yêu cầu:
// Viết hàm để giải mê cung sử dụng đệ quy.


void main(){
  //sohoanhao();
  //print(fibonacci(50)); //in ra fibonacci thứ 50
  printMatrix();  // In ma trận 5x5
}