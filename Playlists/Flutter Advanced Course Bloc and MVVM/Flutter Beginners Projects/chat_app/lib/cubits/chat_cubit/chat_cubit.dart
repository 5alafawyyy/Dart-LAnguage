import 'package:chat_app/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/message_model.dart';
part 'chat_states.dart';

class ChatCubit extends Cubit<ChatStates> {
  ChatCubit() : super(ChatInitialState());

  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessagesCollections);
  List<Message> messagesList = [];
  void sendMessage({required String message, required String email}) {
    try {
      if (message.isNotEmpty) {
        messages.add({
          kMessage: message,
          kCreatedAt: DateTime.now(),
          'id': email,
        });
      }
    } on Exception {
      //
    }
  }

  void getMessages() {
    messages.orderBy(kCreatedAt, descending: true).snapshots().listen((event) {
      messagesList.clear();
      for (var doc in event.docs) {
        messagesList.add(Message.fromJson(doc));
      }
      emit(ChatSuccessState(messages: messagesList));
    });
  }
}
