//Bài toán: Giải mã chuỗi đầu vào có chứa các số và dấu ngoặc vuông, mỗi số đại diện cho số lần lặp lại chuỗi sau đó.
//ví dụ 3[a2[c]] = accaccacc
 //khó điên

//Cho một chuỗi, hãy đếm số lần xuất hiện của từng ký tự trong chuỗi đó
// và trả về dưới dạng Map<Ký tự, Số lần xuất hiện>.
void demchuoi(){
  String chuoi = 'chào con mẹ mày';
  var charCount = <String,int> {};
  List<String> a= chuoi.split('');
  for(var char in a){
    charCount[char]=(charCount[char]??0)+1;
  }
  print(charCount);
}

//Mô tả: Hãy thiết kế một hệ thống đặt chỗ cho bãi đỗ xe ô tô. Bãi đỗ xe có các loại chỗ khác nhau cho xe máy, ô tô, và xe tải.
// Yêu cầu:
// Sử dụng hướng đối tượng và mixin để tạo các loại phương tiện khác nhau (xe máy, ô tô, xe tải) với các thuộc tính riêng.
// Tạo một class ParkingLot để quản lý bãi đỗ xe với các phương thức parkVehicle() và removeVehicle().
// Bãi đỗ xe có giới hạn về số lượng xe cho mỗi loại phương tiện, phải trả về lỗi nếu bãi đỗ đã đầy.
// Gợi ý:
// Sử dụng try-catch để bắt lỗi khi xe không thể đỗ.

mixin typeVehicle{
  String getType();
}
class Car with typeVehicle{
  String getType() {
    return 'car';
  }
}
class Moto with typeVehicle{
  @override
  String getType() {
    return 'moto';
  }
}
class ParkingLot{
 final int carCapacity;
 final int motoCapacity;
 List<Car> cars=[];
 List<Moto> motos=[];
 ParkingLot(this.carCapacity, this.motoCapacity);
  void parkVehicle(typeVehicle Vehicle){
    if(Vehicle is Car && cars.length<carCapacity){
      cars.add(Vehicle);
      print('đõ 1 oto');
    }
    else if(Vehicle is Moto && motos.length < motoCapacity)
      {
        motos.add(Vehicle);
        print('đỗ 1 xe máy');
      }
    else{
      print('khôg còn chỗ cho ${Vehicle.getType()}');
    }
  }
  void removeVehicle(typeVehicle vehicle){
    if (vehicle is Car && cars.contains(vehicle)) {
      cars.remove(vehicle);
      print('1 oto đã rời đi');
    } else if (vehicle is Moto && motos.contains(vehicle)) {
      motos.remove(vehicle);
      print('1 xe máy đã rời đi');
    } else {
      print('khôg có chỗ cho xe đểu này');
    }
  }
}
//Đề bài: Cho một ma trận vuông n x n, hãy tính tổng các phần tử nằm trên đường chéo chính.
List<List<int>> m1= [[1,2,3],[4,6,5],[7,8,9]];
List<List<int>> m2= [[10,11,12],[13,14,15],[16,17,18]];
void tongCheoChinh(){
  int sum =0;
  for(int i = 0;i<m1.length;i++)
    {
      sum +=m1[i][i];
    }
  print(sum);
}
//Đề bài: Một số nguyên n được coi là số đẹp nếu như tổng các chữ số của nó chia hết cho 3.
// Hãy viết hàm kiểm tra xem một số có phải là số đẹp hay không

bool isBeautiful( int a){
  int sum = a.toString().split('').map(int.parse).reduce((a,b)=>a+b);
  return sum%3==0 ;
}
//
void main() {
//demchuoi();

// ParkingLot parkingLot = ParkingLot(0, 3);
// Car car1 = Car();
// Moto bike1 = Moto();
// parkingLot.parkVehicle(car1);  // Parked a Car
// parkingLot.parkVehicle(bike1); // Parked a Motorbike
// parkingLot.removeVehicle(car1);


  isBeautiful(122)==true ?  print('do la so dep') : print('do khong phai la so dep');


}
