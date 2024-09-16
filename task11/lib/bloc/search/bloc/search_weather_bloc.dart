import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:weather/weather.dart';
import 'package:wheather_app/constant/constant.dart';


part 'search_weather_event.dart';
part 'search_weather_state.dart';

Constant call = Constant();
var keyX = call.findX;

class SearchWeatherBloc extends Bloc<SearchWeatherEvent, SearchWeatherState> {
  SearchWeatherBloc() :super(WeatherInitial1()){
    on<FetchWeatherSearch>((event, emit) async {
    try{
      WeatherFactory wf = WeatherFactory(keyX,language:Language.ENGLISH);
      Weather weather1 = await wf.currentWeatherByCityName(event.city);
      emit(WeatherSuccess1(weather1: weather1));
    }
    catch(e){
      emit(WeatherFailure1());
    }
   });
  }
  
}