// Bạn được cho một danh sách liên kết đơn (LinkedList), và cần nhóm tất cả các nút có chỉ số lẻ (vị trí 1, 3, 5, ...) lại với nhau,
// tiếp theo là các nút có chỉ số chẵn (vị trí 2, 4, 6, ...).
// Thứ tự tương đối của các nút bên trong mỗi nhóm phải giữ nguyên so với thứ tự ban đầu.
// Yêu cầu: Giải quyết vấn đề với độ phức tạp không gian O(1) và độ phức tạp thời gian O(n).
class ListNode {
  int val;
  ListNode? next;
  ListNode([this.val = 0, this.next]);
}

ListNode? oddEvenList(ListNode? head) {
  if (head == null || head.next == null) {
    return head;
  }
  ListNode? odd = head;
  // Con trỏ đầu tiên để duyệt danh sách chẵn
  ListNode? even = head.next;
  ListNode? evenHead = even; // Giữ đầu danh sách chẵn

  // Duyệt danh sách liên kết
  while (even != null && even.next != null) {
    odd?.next = even.next; // Gắn nút lẻ tiếp theo
    odd = odd?.next;
    even.next = odd?.next; // Gắn nút chẵn tiếp theo
    even = even.next;
  }

  // Gắn phần chẵn vào cuối phần lẻ
  odd?.next = evenHead;
  return head;
}

void main() {
  // Tạo danh sách liên kết 1 -> 2 -> 3 -> 4 -> 5
  ListNode head = ListNode(2, ListNode(2, ListNode(3, ListNode(4, ListNode(5)))));
  ListNode? result = oddEvenList(head);
  while (result != null) {
    print(result.val);
    result = result.next;
  }
}
