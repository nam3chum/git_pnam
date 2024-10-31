//sử dụng backtracking để giải bài toán tìm tổ hợp có tổng
//băng 1 sô cho trước từ 1 danh sách số nguyên cho trước
void timToHop(List<int> arr,int target,List<List<int>> result,List<int> a,int start)
{
  if(target==0)
    {
      result.add(List.from(a));
      return;
    }
  for(int i = start;i<arr.length;i++)
    {
      if(arr[i]>target) continue;//nếu phần tu lon hon target thi bo qua
      a.add(arr[i]);
      timToHop(arr, target-arr[i], result, a, i);
      a.removeLast();
    }
}

List<List<int>> toHop(List<int> arr ,int k ){
  arr.sort();//loại bỏ trùng lặp
  List<List<int>> result=[];
  timToHop(arr, k, result, [], 0);
  return result;
}
void main() {
  List<int> arr = [3,2,5];
  int target = 8;
  var result = toHop(arr, target);
  print(result); // Kết quả: [[3, 5], [2, 2, 2, 2], [2, 3, 3]]
}
