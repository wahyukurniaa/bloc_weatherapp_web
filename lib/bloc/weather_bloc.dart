import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_weatherapp_web/data/repository/weather_repository.dart';
import 'package:bloc_weatherapp_web/model/weather_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository;
  WeatherBloc(this.weatherRepository) : super(WeatherInitial()) {
    on<WeatherFethced>(_getCurrentWeather);
  }

  void _getCurrentWeather(
    WeatherFethced event,
    Emitter<WeatherState> emitter,
  ) async {
    emit(WeatherLoading());
    try {
      final weather = await weatherRepository.getCurrentWeather();
      emit(WeatherSuccess(weatherModel: weather));
    } catch (e) {
      emit(WeatherFailure(e.toString()));
    }
  }
}
