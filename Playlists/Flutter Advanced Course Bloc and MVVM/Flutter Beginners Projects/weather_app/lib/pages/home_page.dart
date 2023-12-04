import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/cubits/weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/pages/search_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = Provider.of<WeatherCubit>(context);
  return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SearchPage();
                  },
                ),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
        title: const Text('Weather App'),
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ],
              ),
            );
          } else if (state is WeatherLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is WeatherLoadedState) {
            return Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  cubit.weatherModel!.getThemeColor(),
                  cubit.weatherModel!.getThemeColor()[300]!,
                  cubit.weatherModel!.getThemeColor()[100]!,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 3,
                  ),
                   Text(
                   cubit.cityName!,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'updated at : ${cubit.weatherModel!.date.hour.toString()}:${cubit.weatherModel!.date.minute.toString()}',
                    style: const TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(cubit.weatherModel!.getImage()),
                      Text(
                        cubit.weatherModel!.temp.toInt().toString(),
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                              'maxTemp :${cubit.weatherModel!.maxTemp.toInt()}'),
                          Text(
                              'minTemp : ${cubit.weatherModel!.minTemp.toInt()}'),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    cubit.weatherModel!.weatherStateName,
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(
                    flex: 5,
                  ),
                ],
              ),
            );
          } else {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
        },
      ),
    );
  }
}
