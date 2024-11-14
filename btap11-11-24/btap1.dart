// cộng 2 số ở 2 danh sách liên kết ngược chiều
// Input:
// l1 = [2,4,3]
// l2 = [5,6,4]
// Output: 342+465 =807
// [7,0,8]
class ListNode{
  int val;
  ListNode? next;

  ListNode([this.val=0, this.next]);
}

ListNode? addTwoNumber(ListNode? l1,ListNode? l2){
  ListNode init = ListNode();
  ListNode current= init;
  int carry = 0;
  while(l1!=null || l2!=null){
    int sum = (l1?.val??0) + (l2?.val??0) + carry;
    carry = sum ~/ 10;
    current.next = ListNode(sum%10);
    current = current.next!;
    l1= l1?.next;
    l2= l2?.next;
  }
  return init;
}

void main(){

  ListNode l1 = ListNode(3,ListNode(4,ListNode(2)));
  ListNode l2 = ListNode(5,ListNode(6,ListNode(4)));

ListNode? result =  addTwoNumber(l1, l2);
  while(result !=null)
    {
      print(result.val);
      result = result.next;
    }
}