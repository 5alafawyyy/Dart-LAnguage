part of 'chat_cubit.dart';

abstract class ChatStates {}

class ChatInitialState extends ChatStates {}

class ChatSuccessState extends ChatStates {
  final List<Message> messages;

  ChatSuccessState({required this.messages});
}
