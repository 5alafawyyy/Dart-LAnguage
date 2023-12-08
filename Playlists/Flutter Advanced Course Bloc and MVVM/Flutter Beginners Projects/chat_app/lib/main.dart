import 'package:chat_app/cubits/login_cubit/login_cubit.dart';
import 'package:chat_app/cubits/register_cubit/register_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/pages/resgister_page.dart';

import 'cubits/chat_cubit/chat_cubit.dart';
import 'cubits/user_cubit/user_cubit.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyChat());
}

class MyChat extends StatelessWidget {
  const MyChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     User? user;
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserCubit()..checkUserLoggedIn(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => ChatCubit()..getMessages(),
        ),
      ],
      child: BlocConsumer<UserCubit, UserState>(
        listener: (BuildContext context, UserState state) {
          if (state is UserLoggedIn) {
            user = state.user;
          }
        },
        builder: (context, state) {
          return MaterialApp(
            routes: {
              LoginPage.id: (context) => LoginPage(),
              RegisterPage.id: (context) => RegisterPage(),
              ChatPage.id: (context) => ChatPage(
                    user: user,
                  )
            },
            initialRoute: (state is UserLoggedIn) ? ChatPage.id : LoginPage.id,
          );
        },
      ),
    );
  }
}
