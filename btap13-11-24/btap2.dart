//Với các cặp dấu ngoặc đơn cho trước n,
// hãy viết một hàm để tạo ra tất cả các tổ hợp dấu ngoặc đơn đúng chuẩn .
List<String> generateParenthesis(int n){
  final list = <String>[];
  reGenerate(n, 0, 0, "", list);
  return list;
}

void reGenerate(int n, int open, int close, String s, List<String> list) {
  if (s.length == n * 2) {
    list.add(s);
  }
  if (open < n) {
    reGenerate(n, open + 1, close, "$s(", list);
  }
  if (open > close) {
    reGenerate(n, open, close + 1, "$s)", list);
  }

}

//cho 1 mảng nums và 1 số k , tìm số lớn thứ k trong mảng

// int findKthLargest(List<int> nums, int k) {
//   int max= 0;
//   nums.sort((a,b)=>b.compareTo(a));
//   return nums[k-1];
// }

//cách 2
int quickSelect(List<int> nums, int left, int right, int k) {
  int pivot = nums[right];
  int partitionIndex = left;

  for (int i = left; i < right; i++) {
    if (nums[i] >= pivot) {
      int temp = nums[i];
      nums[i] = nums[partitionIndex];
      nums[partitionIndex] = temp;
      partitionIndex++;
    }
  }

  int temp = nums[right];
  nums[right] = nums[partitionIndex];
  nums[partitionIndex] = temp;

  if (partitionIndex == k - 1) {
    return nums[partitionIndex];
  } else if (partitionIndex > k - 1) {
    return quickSelect(nums, left, partitionIndex - 1, k);
  } else {
    return quickSelect(nums, partitionIndex + 1, right, k);
  }
}

int findKthLargest(List<int> nums, int k) {
  print(nums.toList());
  return quickSelect(nums, 0, nums.length - 1, k);
}
//Cho một mảng số nguyên numscó độ dài nvà một số nguyên target, hãy tìm ba số nguyên numssao cho tổng gần nhất với target.
// Trả về tổng của ba số nguyên .
// Bạn có thể cho rằng mỗi đầu vào sẽ có đúng một giải pháp.
int threeSumClosest(List<int> nums, int target) {
  nums.sort(); // Sắp xếp mảng
  int sum = nums[0] + nums[1] + nums[2]; // Tổng gần nhất ban đầu

  for (int i = 0; i < nums.length - 2; i++) {
    int left = i + 1;
    int right = nums.length - 1;

    while (left < right) {
      int currentSum = nums[i] + nums[left] + nums[right];

      // Cập nhật nếu tìm thấy tổng gần hơn
      if ((currentSum - target).abs() < (sum - target).abs()) {
        sum = currentSum;
      }

      if (currentSum < target) {
        left++;
      } else if (currentSum > target) {
        right--;
      } else {
        // Nếu tổng bằng đúng target thì trả về luôn
        return currentSum;
      }
    }
  }

  return sum;
}

void main(){
  // var a= generateParenthesis(3);
  // print(a.toList());
  int a= threeSumClosest([-3,2,3,1,2,4,5,6,7,6], 1);
  print(a);
}