import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_future_stream_provider_demo/repositories/weather_repository.dart';

var weatherRepositoryProvider =
    Provider<WeatherRepository>((ref) => WeatherRepository());

var weatherFutureProvider = FutureProvider<Weathers>(
    (ref) => ref.watch(weatherRepositoryProvider).getCurrentWeather("Jakarta"));

var weatherStreamProvider = StreamProvider<Weathers>(
    (ref) => ref.watch(weatherRepositoryProvider).getWeatherStream("Jakarta"));
