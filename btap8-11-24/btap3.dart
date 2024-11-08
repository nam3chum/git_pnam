// Trong một vườn cây, bạn muốn tìm ra số lượng cây cần trồng sao cho chúng không bị che khuất bởi cây khác.
// Cây chỉ bị che khuất nếu cây mới trồng cao hơn cây cũ,
// và chúng được trồng tại các vị trí liên tiếp.
// Yêu cầu:
// Bạn có một mảnh vườn với chiều dài là n, và mỗi cây có chiều cao nhất định.
// Bạn cần tính xem bao nhiêu cây cần trồng sao cho cây nào cũng không bị che khuất bởi cây khác.
int vuon(List<int> a) {
  int count = 1; // Cây đầu tiên luôn được trồng
  int max = a[0]; // Cây đầu tiên có chiều cao là cây cao nhất ban đầu
  for (int i = 1; i < a.length; i++) {
    if (a[i] > max) {
      count++;
      max = a[i]; // Cập nhật cây cao nhất
    }
  }
  return count;
}

void main()
{

  int a= vuon([1,3,4,5,6,2]);
  print(a);
}