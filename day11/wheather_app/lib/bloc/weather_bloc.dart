import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:wheather_app/constant/constant.dart';
part 'weather_event.dart';
part 'weather_state.dart';

Constant call = Constant();
var keyX = call.findX;

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherBloc() : super(WeatherInitial()){
    on<FetchWeather>((event, emit) async {
      try{
        WeatherFactory wf = WeatherFactory(keyX,language:Language.ENGLISH);

        Weather weather = await wf.currentWeatherByLocation(event.position.latitude, event.position.longitude);

        emit(WeatherSuccess(weather: weather));

      }
      catch(e){
        emit(WeatherFailure());
      }
    });
    }
}
  
