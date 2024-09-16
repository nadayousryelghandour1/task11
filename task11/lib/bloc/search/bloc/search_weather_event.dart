part of 'search_weather_bloc.dart';

abstract class SearchWeatherEvent extends Equatable {
  const SearchWeatherEvent();

  @override
  List<Object> get props => [];
}
class FetchWeatherSearch extends SearchWeatherEvent {
  final String  city;
  const FetchWeatherSearch({required this.city});
  @override
  List<Object> get props => [city];
}