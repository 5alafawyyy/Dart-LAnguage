// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../cubits/weather_cubit.dart';

class SearchPage extends StatelessWidget {
  SearchPage({
    super.key,
  });
  String? cityName;
  @override
  Widget build(BuildContext context) {
    WeatherCubit cubit = Provider.of<WeatherCubit>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (data) {
             cityName = data;
              cubit.cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;
              cubit.cityName = data;

              cubit.getWeather(cityName: cityName!);

              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              label: const Text('search'),
              suffixIcon: GestureDetector(
                  onTap: () async {
                    cubit.getWeather(cityName: cityName!);

                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.search)),
              border: const OutlineInputBorder(),
              hintText: 'Enter a city',
            ),
          ),
        ),
      ),
    );
  }
}
