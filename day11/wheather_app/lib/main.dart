import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:wheather_app/bloc/weather_bloc.dart';
import 'package:wheather_app/data/determine_position.dart';
import 'package:wheather_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}


  // This widget is the root of your application.
  @override
 class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
          debugShowCheckedModeBanner: false,
       
          home: FutureBuilder(
            future: determinePosition , builder: (context, snap) {
              if (snap.hasData) {
                return BlocProvider<WeatherBloc>(create : (context) => WeatherBloc()
                ..add(
                  FetchWeather(position:
                  snap.data as Position
                   )
                  ),
                  child: const HomeScreen(),
                );
              }
              
              else{
                return const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },) ,
        );
  }
}
