// Bài toán: Quản lý Hệ thống Đặt phòng Khách sạn
// Hãy xây dựng một hệ thống quản lý đặt phòng khách sạn. Hệ thống cần hỗ trợ các yêu cầu sau:
// Lớp Room: Đại diện cho một phòng trong khách sạn.
// Các thuộc tính:
// id: Mã phòng (số nguyên).
// type: Loại phòng (String).
// price: Giá phòng (số thập phân).
// isAvailable: Trạng thái phòng (có sẵn hay không).
// Lớp Customer: Đại diện cho một khách hàng.
// Các thuộc tính:
// id: Mã khách hàng (số nguyên).
// name: Tên khách hàng (String).
// email: Email khách hàng (String).
// Lớp Booking: Đại diện cho một lần đặt phòng.
// Các thuộc tính:
// id: Mã đặt phòng (số nguyên).
//
// room: Đối tượng Room được đặt.
// checkInDate: Ngày nhận phòng (DateTime).
// checkOutDate: Ngày trả phòng (DateTime).
// Yêu cầu xử lý:
// Viết một phương thức trong lớp Hotel để thêm phòng vào danh sách phòng của khách sạn.
// Viết một phương thức để thêm khách hàng mới.
// Viết một phương thức để đặt phòng, kiểm tra nếu phòng có sẵn thì thêm đặt phòng vào hệ thống và cập nhật trạng thái phòng.
// Viết một phương thức để hiển thị tất cả các đặt phòng của một khách hàng cụ thể.
// Yêu cầu phụ:
// Xử lý ngoại lệ nếu phòng không có sẵn khi đặt.
// Sử dụng mixin để bổ sung một số chức năng (như tính tổng doanh thu từ các đặt phòng).

mixin tinhtoan{
  int tongdoanhthu(int numOfRoom,int priceOfRoom){
    return numOfRoom*priceOfRoom;
  }
}
class Room{
  int id;
  String type;
  double price;
  bool isAvailable;

  Room(this.id, this.type, this.price, [this.isAvailable=false]);

  @override
  String toString() {
    return 'Room{id: $id, type: $type, price: $price, isAvailable: $isAvailable}';
  }
}
class Customer{
  int id;
  String name,email;

  Customer(this.id, this.name, this.email);

  @override
  String toString() {
    return 'Customer{id: $id, name: $name, email: $email}';
  }
}
class Booking{
  int id;
  Customer customer;
  Room room;
  DateTime checkInDate,checkOutDate;

  Booking(
      this.id, this.customer, this.room, this.checkInDate, this.checkOutDate);

  @override
  String toString() {
    return 'Booking{id: $id, customer: $customer, room: $room, checkInDate: $checkInDate, checkOutDate: $checkOutDate}';
  }
}
class Hotel{
  List<Room> rooms= [];
  List<Customer> customers= [];
  List<Booking> books=[];
   void addRoom(Room room){
     rooms.add(room);
     print('đã thêm phòng loại ${room.type} với id ${room.id}');
   }
   void addCustomer(Customer customer){
     customers.add(customer);
     print('đã thêm khách hàng: ${customer.name} với id ${customer.id}');
   }

   void bookRoom(int cusId, int roomId, DateTime checkIn,DateTime checkOut){
      if(rooms.isEmpty||customers.isEmpty){
        throw Exception('không có phòng hoặc hông có khách hàng');
      }
      else{
       Room room =  rooms.firstWhere((a)=> a.id == roomId && a.isAvailable ==true);
       Customer customer =customers.firstWhere((a)=> a.id==cusId);

       room.isAvailable =false;
       int bookingId = books.length +1;
       Booking booking = Booking(bookingId, customer, room, checkIn, checkOut);
       books.add(booking);
       print('khách hàng với mã ${cusId} đã đặt phòng ${roomId}');
      }
   }
  void hienThi(int customerId) {
    List<Booking> customerBookings = books.where((b) => b.customer.id == customerId).toList();
    if (customerBookings.isEmpty) {
      print('không có phòng nào được đặt bởi khách hàng $customerId');
    } else {
      print('đẵ đặt phòng cho khách có mã ID $customerId:');
      for (var booking in customerBookings) {
        print(booking);
      }
    }
   }
}
void main() {
  Hotel hotel = Hotel();
  hotel.addRoom(Room(1, 'Single', 100.0, true));
  hotel.addRoom(Room(2, 'Double', 150.0, true));

  hotel.addCustomer(Customer(1, 'Alice', 'alice@example.com'));
  hotel.addCustomer(Customer(2, 'Bob', 'bob@example.com'));

  try {
    hotel.bookRoom(1, 3, DateTime(2024, 12, 1), DateTime(2024, 12, 5));
    hotel.bookRoom(2, 2, DateTime(2024, 12, 10), DateTime(2024, 12, 15));
  } catch (e) {
    print('Error: $e');
  }

  hotel.hienThi(1);
}
