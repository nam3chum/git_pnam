//Tạo lớp cơ bản Vehicle:
//
// Có các thuộc tính: brand, model, year.
// Có phương thức describe() để in ra thông tin của xe: "Brand: [brand], Model: [model], Year: [year]".
// Sau đó:
//
// Tạo lớp Car kế thừa từ Vehicle:
// Có thêm thuộc tính numDoors: số cửa xe.
// Override phương thức describe() để in ra thêm số cửa xe: "Number of doors: [numDoors]".
// Viết chương trình:
//
// Tạo một đối tượng từ lớp Vehicle và một đối tượng từ lớp Car.
// Gọi phương thức describe() của cả hai lớp.


class Vehicle{
  String? brand;
  String? model;
  int? year;


  Vehicle(this.brand, this.model, this.year);

  void describe(){
    print('Brand: [$brand], Model: [$model], Year: [$year]');
  }
}
class Car extends Vehicle{
  int? numDoors;
  Car(super.brand, super.model, super.year,this.numDoors);

  @override
  void describe() {

    // TODO: implement describe
    super.describe();
    print('Number of door:$numDoors');
  }
}
void main()
{
  var vehicle = Vehicle('Toyota', 'Corolla', 2020);
  var car = Car('Honda', 'Civic', 2022, 4);

  vehicle.describe(); 
  car.describe();    
}
