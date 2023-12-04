import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/weather_model.dart';

import '../services/weather_service.dart';
part 'weather_states.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitialState());

  WeatherService weatherService;
  WeatherModel? weatherModel;
  String? cityName;

  Future<void> getWeather({required String cityName}) async {
    emit(WeatherLoadingState());
    try {
      weatherModel = await WeatherService().getWeather(cityName: cityName);
      emit(WeatherLoadedState(weatherModel: weatherModel!));
    } catch (e) {
      emit(WeatherErrorState(error: e.toString()));
    }
  }
}
