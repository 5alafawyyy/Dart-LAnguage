import 'package:basketball_counter_app/cubits/points_counter_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PointsCounterCubit, PointsCounterState>(
          builder: (BuildContext context, PointsCounterState state) {
        final cubit = context.read<PointsCounterCubit>();

        double width = MediaQuery.sizeOf(context).width;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.orange,
            title: const Text('Points Counter'),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Team E',
                          style: TextStyle(
                            fontSize: 32,
                          ),
                        ),
                        Text(
                          '${cubit.teamAPoints}',
                          style: TextStyle(
                            fontSize: (cubit.teamAPoints.toString().length > 2)
                                ? (width /
                                    (cubit.teamAPoints.toString().length + 1))
                                : 150,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(8),
                            backgroundColor: Colors.orange,
                            minimumSize: const Size(150, 50),
                          ),
                          onPressed: () {
                            cubit.incrementTeamA(1);

                            if (kDebugMode) {
                              print(cubit.teamAPoints);
                            }
                          },
                          child: const Text(
                            'Add 1 Point ',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            minimumSize: const Size(150, 50),
                          ),
                          onPressed: () {
                            cubit.incrementTeamA(3);
                          },
                          child: const Text(
                            'Add 2 Point',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            minimumSize: const Size(150, 50),
                          ),
                          onPressed: () {
                            cubit.incrementTeamA(3);
                          },
                          child: const Text(
                            'Add 3 Point ',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 500,
                    child: VerticalDivider(
                      indent: 50,
                      endIndent: 50,
                      color: Colors.grey,
                      thickness: 1,
                    ),
                  ),
                  SizedBox(
                    height: 500,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Team B',
                          style: TextStyle(
                            fontSize: 32,
                          ),
                        ),
                        Text(
                          '${cubit.teamBPoints}',
                          style: TextStyle(
                            fontSize: (cubit.teamBPoints.toString().length > 2)
                                ? (width /
                                    (cubit.teamBPoints.toString().length + 1))
                                : 150,
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(8),
                            backgroundColor: Colors.orange,
                            minimumSize: const Size(150, 50),
                          ),
                          onPressed: () {
                            cubit.incrementTeamB(1);
                          },
                          child: const Text(
                            'Add 1 Point ',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            minimumSize: const Size(150, 50),
                          ),
                          onPressed: () {
                            cubit.incrementTeamB(2);
                          },
                          child: const Text(
                            'Add 2 Point ',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            minimumSize: const Size(150, 50),
                          ),
                          onPressed: () {
                            cubit.incrementTeamB(3);
                          },
                          child: const Text(
                            'Add 3 Point ',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(8),
                  backgroundColor: Colors.orange,
                  minimumSize: const Size(150, 50),
                ),
                onPressed: () {
                  cubit.resetCounters();
                },
                child: const Text(
                  'Reset',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
