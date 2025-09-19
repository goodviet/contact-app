import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/contact_data.dart';

// Tạo Events -- Bloc Contact
abstract class ContactEvent {}

class LoadContacts extends ContactEvent {}

// Tạo States -- Bloc Contact
abstract class ContactState {}

class ContactInitial extends ContactState {}

class ContactLoading extends ContactState {}

class ContactLoaded extends ContactState {
  final List<Contact> contacts;
  ContactLoaded(this.contacts);
}

// Tạo Bloc - Bloc Contact
class ContactBloc extends Bloc<ContactEvent, ContactState> {
  final ContactRepository contactRepository;

  ContactBloc(this.contactRepository) : super(ContactInitial()) {
    on<LoadContacts>((event, emit) async {
      emit(ContactLoading());
      try {
        final contacts = await contactRepository.fetchContacts();
        emit(ContactLoaded(contacts));
      } catch (e) {
        emit(ContactError("Failed"));
      }
    });
  }
}

class ContactError extends ContactState {
  final String message;
  ContactError(this.message);
}