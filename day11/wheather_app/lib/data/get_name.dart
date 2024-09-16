import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:wheather_app/bloc/search/bloc/search_weather_bloc.dart';


Future<void> fetchWeatherData(BuildContext context,String searchQuery) async {

  if (searchQuery.isEmpty) {
    // Handle invalid search query
    // ignore: avoid_print
    print('Invalid search query');
    return;
  }
  // Make the API call to fetch the weather data for the search query
  final response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$searchQuery&appid=48819458909f8af83c70d258a9537252'));

  if (response.statusCode == 200) {
    
    // Update the WeatherBloc with the new weather data
    // ignore: use_build_context_synchronously
    context.read<SearchWeatherBloc>().add(FetchWeatherSearch(city: searchQuery));
  } else {
    // Handle the error
    // ignore: avoid_print
    print('Error fetching weather data: ${response.statusCode}');
  }
}