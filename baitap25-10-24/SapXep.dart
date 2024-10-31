//thuật toán nối bọt
//Gợi ý: Bubble Sort hoạt động bằng cách liên tục lặp qua danh sách,
// so sánh và hoán đổi các cặp phần tử liền kề nếu chúng không theo đúng thứ tự.
// Quá trình này lặp lại cho đến khi không còn phép hoán đổi nào nữa.
List<int> bubbleSoft(List<int> list){
  int n = list.length;
  for(int i =0;i<n-1;i++)
    {
      for(int j =0;j<n-i-1;j++)
        {
          if(list[j]>list[j+1]){
            int temp= list[j];
            list[j] = list[j+1];
            list[j+1]=temp;
          }

        }
    }
  return list;
}
//thuật toán sắp xếp chèn
List<int> insertionSoft(List<int> list){
  for(int i =1;i<list.length;i++)
    {
     int k = list[i];
     int j = i-1;
    //đẩy các phần tử list[0...i-1]
     //về sau để tạo khoảng trống cho k
     while(j>=0 && list[j]>k){
       list[j+1] =list[j];
       j=j-1;
     }
     list[j+1]=k;
    }
  return list;
}
//thuật toán sắp xếp nhanh(quíckSoft)
List<int> quickSort(List<int> list) {
   int pivot = list[list.length~/2];
   List<int> left= [];
   List<int> right = [];
   List<int> equal = [];
   for(var i in list){
     if(i<pivot) left.add(i);
     else if(i>pivot) right.add(i);
     else equal.add(i);
   }

   return [...left,...equal,...right];
}
//thuật toán
void main(){
  List<int> list = [64, 34, 25, 12, 22, 11, 90];
  //print(bubbleSoft(numbers));
  print(insertionSoft(list));
  print(quickSort(list));
}