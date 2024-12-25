import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/Controller/Riverpod/weatherProvider.dart';


class Homescreen extends ConsumerWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherState = ref.watch(weatherProvider);
    final cityController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App with Riverpod'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: cityController,
                decoration: const InputDecoration(
                  labelText: 'Enter City',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  final city = cityController.text.trim();
                  if (city.isNotEmpty) {
                    ref.read(weatherProvider.notifier).fetchWeather(city);
                  }
                },
                child: const Text('Get Weather'),
              ),
              const SizedBox(height: 16),
              weatherState.when(
                data: (weatherData) {
                  if (weatherData == null) {
                    return const Text('Enter a city to see the weather.');
                  } else {
                    return Card(
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'City: ${weatherData.name}',
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text(
                              'Temperature: ${weatherData.main.temp.toStringAsFixed(1)}°C',
                              style: const TextStyle(fontSize: 18),
                            ),
                            Text(
                              'Weather: ${weatherData.weather[0].description}',
                              style: const TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (err, stack) => Text(
                  err.toString(),
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
