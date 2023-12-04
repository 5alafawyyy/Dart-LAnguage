part of 'weather_cubit.dart';

abstract class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadingState extends WeatherState {}

class WeatherLoadedState extends WeatherState {
  WeatherModel weatherModel;

  WeatherLoadedState({required this.weatherModel});
}class WeatherErrorState extends WeatherState {
  final String error;

  WeatherErrorState({required this.error});
}



