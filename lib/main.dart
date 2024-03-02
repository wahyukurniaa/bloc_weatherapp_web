import 'package:bloc_weatherapp_web/bloc/weather_bloc.dart';
import 'package:bloc_weatherapp_web/data/data_provider/weather_data_provider.dart';
import 'package:bloc_weatherapp_web/data/repository/weather_repository.dart';
import 'package:bloc_weatherapp_web/presentation/screen/weather_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WeatherRepository(
        WeatherDataProvider(),
      ),
      child: BlocProvider(
        create: (context) => WeatherBloc(
          context.read<WeatherRepository>(),
        ),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(useMaterial3: true),
          home: const WeatherScreen(),
        ),
      ),
    );
  }
}
