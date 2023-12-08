import 'package:chat_app/cubits/user_cubit/user_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/constants.dart';
import 'package:chat_app/models/message_model.dart';
import 'package:chat_app/widgets/chat_buble.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubits/chat_cubit/chat_cubit.dart';

class ChatPage extends StatelessWidget {
  static const String id = 'ChatPage';
  ChatPage({super.key, this.user});
  final User? user;

  final ScrollController _controller = ScrollController();
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var email =
        user?.email ?? (ModalRoute.of(context)!.settings.arguments.toString());

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              kLogo,
              height: 50,
            ),
            const Text('chat'),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              BlocProvider.of<UserCubit>(context).signOut();
            },
            icon: const Icon(Icons.logout_outlined),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<ChatCubit, ChatStates>(
              builder: (context, state) {
                List<Message> messagesList =
                    BlocProvider.of<ChatCubit>(context).messagesList;

                return ListView.builder(
                    reverse: true,
                    controller: _controller,
                    itemCount: messagesList.length,
                    itemBuilder: (context, index) {
                      return messagesList[index].id == email
                          ? ChatBuble(
                              message: messagesList[index],
                            )
                          : ChatBubleForFriend(message: messagesList[index]);
                    });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: controller,
              onSubmitted: (data) {
                _onPressed(
                  context: context,
                  email: email,
                  message: controller.text,
                );
              },
              decoration: InputDecoration(
                hintText: 'Send Message',
                suffixIcon: IconButton(
                  onPressed: () {
                    _onPressed(
                      context: context,
                      email: email,
                      message: controller.text,
                    );
                  },
                  icon: const Icon(
                    Icons.send,
                    color: kPrimaryColor,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onPressed({
    required String email,
    required String message,
    required BuildContext context,
  }) {
    BlocProvider.of<ChatCubit>(context).sendMessage(
      email: email.toString(),
      message: message,
    );

    controller.clear();
    _controller.animateTo(
      0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
    );
  }
}
