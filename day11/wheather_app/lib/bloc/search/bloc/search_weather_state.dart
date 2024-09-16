part of 'search_weather_bloc.dart';

abstract class SearchWeatherState extends Equatable {
  const SearchWeatherState();
  
  @override
  List<Object> get props => [];
}

final class WeatherInitial1 extends SearchWeatherState {}
final class WeatherLoading1 extends SearchWeatherState {}
final class WeatherFailure1 extends SearchWeatherState {}
final class WeatherSuccess1 extends SearchWeatherState {
  final Weather weather1;
  const WeatherSuccess1({required this.weather1});
  @override
  List<Object> get props => [weather1];
}
