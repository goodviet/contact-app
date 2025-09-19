class Contact {
  final String name;
  final String phone;

  Contact({required this.name, required this.phone});
}

class ContactRepository {
  Future<List<Contact>> fetchContacts() async {
    // Giả lập lấy dữ liệu từ API hoặc database
    await Future.delayed(const Duration(seconds: 1));
    return [
      Contact(name: "Anh A3", phone: "0354621397"),
      Contact(name: "Nguyen Thi Nhung", phone: "0354621397"),
      Contact(name: "Pham Nhat", phone: "0345621789"),
      Contact(name: "Tran Van Hieu", phone: "0986421345"),
      Contact(name: "Phan Minh", phone: "0345621789"),
    ];
  }
}
