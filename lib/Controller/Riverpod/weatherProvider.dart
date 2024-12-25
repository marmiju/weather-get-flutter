import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/Controller/Service/data_api.dart';
import 'package:weather/Model/Weather_model.dart';

final weatherProvider = StateNotifierProvider<WeatherNotifier, AsyncValue<WeatherData?>>(
  (ref) => WeatherNotifier(),
);

// Weather Provider to handle state

class WeatherNotifier extends StateNotifier<AsyncValue<WeatherData?>> {
  WeatherNotifier() : super(const AsyncValue.data(null));

  Future<void> fetchWeather(String city) async {
    state = const AsyncValue.loading();
    try {
      final data = await DataApi.fetchData(city);
      if (data != null) {
        state = AsyncValue.data(data);
      } else {
        state = AsyncValue.error('Error: City not found', StackTrace.current);
      }
    } catch (e, stackTrace) {
      state = AsyncValue.error('An error occurred: $e', stackTrace);
    }
  }
}
