import 'package:chat_app/blocs/auth/auth_bloc.dart';
import 'package:chat_app/cubits/user_cubit/user_cubit.dart';
import 'package:chat_app/my_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/pages/chat_page.dart';
import 'package:chat_app/pages/login_page.dart';
import 'package:chat_app/pages/resgister_page.dart';

import 'cubits/chat_cubit/chat_cubit.dart';
import 'firebase_options.dart';
import 'helper/cache_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyChat());
}

class MyChat extends StatefulWidget {
  const MyChat({Key? key}) : super(key: key);

  @override
  State<MyChat> createState() => _MyChatState();
}

class _MyChatState extends State<MyChat> {
  CacheHelper cacheHelper =CacheHelper();

  @override
  Widget build(BuildContext context) {
    
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(),
        ),
        BlocProvider(
          create: (context) => UserCubit(),
        ),
        BlocProvider(
          create: (context) => ChatCubit()..getMessages(),
        ),
      ],
      child: MaterialApp(
        routes: {
          LoginPage.id: (context) => LoginPage(),
          RegisterPage.id: (context) => RegisterPage(),
          ChatPage.id: (context) => ChatPage()
        },
        initialRoute: (CacheHelper.get(key: 'uid') != null) ? ChatPage.id : LoginPage.id,
      ),
    );
  }
}
