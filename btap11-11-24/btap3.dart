//xoá node thứ n từ đếm ngược từ cuối danh sách
 //vd: Đầu vào: head = [1,2,3,4,5], n = 2
//  Đầu ra: [1,2,3,5]
class ListNode {
  int val;
  ListNode? next;
  ListNode(this.val, [this.next]);
}

ListNode? removeNthFromEnd(ListNode? head, int n) {
  ListNode init = ListNode(0, head);
  ListNode? first = init;
  ListNode? second = init;

  // Di chuyển con trỏ first n + 1 bước
  for (int i = 0; i <= n; i++) {
    first = first?.next;
  }

  // Di chuyển cả hai con trỏ cho đến khi first đến cuối danh sách
  while (first != null) {
    first = first.next;
    second = second?.next;
  }

  // Xóa node thứ n từ cuối
  second?.next = second.next?.next;

  return init.next;
}

// Hàm tiện ích để in danh sách liên kết
void printList(ListNode? head) {
  ListNode? current = head;
  while (current != null) {
    print(current.val);
    current = current.next;
  }
}

void main() {
  ListNode head = ListNode(1, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))));
  printList(removeNthFromEnd(head, 2)); // Output: [1, 2, 3, 5]
}
