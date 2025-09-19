import 'package:collection/collection.dart';
import '../data/contact_data.dart';

class ContactViewModel {
  final List<Contact> contacts;

  ContactViewModel(this.contacts);

  // Lọc danh sách liên hệ 
  List<Contact> filterContacts(String query) {
    if (query.isEmpty) return contacts;
    return contacts
        .where((contact) =>
            contact.name.toLowerCase().contains(query.toLowerCase()) ||
            contact.phone.contains(query))
        .toList();
  }

  // liên hệ theo chữ cái đầu tiên
  Map<String, List<Contact>> groupContacts(List<Contact> filteredContacts) {
    return groupBy(
      filteredContacts,
      (Contact contact) => contact.name[0].toUpperCase(),
    );
  }
}