import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:basketball_counter_app/views/home_view.dart';
import 'package:flutter/material.dart';

import '../cubits/points_counter_cubit.dart';

class PointsCounterApp extends StatelessWidget {
  const PointsCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => PointsCounterCubit(),
      child:  const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}
