//Cho một mảng các số nguyên, tìm phần tử lớn thứ hai mà không sắp xếp lại mảng hoặc thay đổi thứ tự.

import 'dart:math';

List<int> a= [6,2,3,4,5,1];
void timLonThu2(){
  int max= a[0];
  int max2= -1;
  for(int i =1;i<a.length;i++){
    if(max < a[i]) {
      max = a[i];
    }

  }
  a.remove(max);
  for(int i = 0;i<a.length;i++)
    {
      if(max2<a[i]) {
        max2 = a[i];
      }
    }
  print(max2);
}

void main(){
  timLonThu2();
}