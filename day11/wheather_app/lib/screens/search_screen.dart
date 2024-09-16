import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:wheather_app/bloc/search/bloc/search_weather_bloc.dart';
import 'package:wheather_app/data/get_weather_icons.dart';
import 'package:wheather_app/widget/my_image_asset.dart';
import 'package:wheather_app/widget/my_sized_box.dart';
import 'package:wheather_app/widget/my_text.dart';


String areaName = '';

class SearchScreen extends StatelessWidget {
  // final TextEditingController cityController;
  const SearchScreen({ super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.black,
        appBar: AppBar(
          iconTheme: const IconThemeData(
            color: Colors.transparent, //change your icon theme here
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.dark,
          ),
          
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 20),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Stack(children: [
              Align(
                alignment: const AlignmentDirectional(3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                      color: Colors.deepPurple, shape: BoxShape.circle),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(-3, -0.3),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                      color: Colors.deepPurple, shape: BoxShape.circle),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, -1.2),
                child: Container(
                  height: 300,
                  width: 300,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFAB40),
                  ),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100, sigmaY: 100),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                ),
              ),
        
        
        
              BlocBuilder<SearchWeatherBloc, SearchWeatherState>(
                builder: (context, state) {
                   if (state is WeatherSuccess1) {
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //first bloc
                          myText(text: '📍 : ${state.weather1.country}', fontSize: 22),
                          mySizedBox(height: 5),
                          myText(text: '${state.weather1.areaName}', fontSize: 35),
                    
                          //second bloc
                        SizedBox(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                             GetWeatherIcons(code: state.weather1.weatherConditionCode!) ,
                              myText(text: '${state.weather1.tempFeelsLike?.celsius?.round()} °C', fontSize: 45, bold: true),
                              myText(text: '${state.weather1.weatherMain?.toUpperCase()}', fontSize: 32),
                              myText(text: '${DateFormat('EEEE d • ').format(state.weather1.date!)}${DateFormat.jm().format(state.weather1.date!)}', fontSize: 22),
                              mySizedBox(height: 30),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                 myImageAsset(imagePath: 'assets/11.png'),
                                 Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    myText(text: 'Sunrise',fontSize: 20),
                                    myText(text: DateFormat.jm().format(state.weather1.sunrise!),fontSize: 20),  
                                  ]
                                 ),
                                 mySizedBox(width: 30),
                                 myImageAsset(imagePath: 'assets/12.png'),
                                 Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    myText(text: 'Sunset',fontSize: 20),
                                    myText(text: DateFormat.jm().format(state.weather1.sunset!),fontSize: 20),  
                                  ]
                                 ),
                                ]
                              ),
                              const SizedBox(
                                width: 330,
                                child: Divider(
                                  color: Colors.grey,
                                ),
                              ),
                              mySizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                 myImageAsset(imagePath: 'assets/13.png'),
                                 Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    myText(text: 'Temp Max',fontSize: 20),
                                    myText(text: '${state.weather1.tempMax?.celsius?.round()} °C',fontSize: 20),  
                                  ]
                                 ),
                                 mySizedBox(width: 30),
                                 myImageAsset(imagePath: 'assets/14.png'),
                                 Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    myText(text: 'Temp Min',fontSize: 20),
                                    myText(text: '${state.weather1.tempMin?.celsius?.round()} °C',fontSize: 20,bold: true),  
                                  ]
                                 ),
                                ]
                              )
        
                            ],
                          )
                        ),
        
                       
                       
                    ],
                      );
                  }
        
                  
                  else{
                    return const Center(child: Text('No weather data available',
                    style: TextStyle(fontSize: 20, color: Colors.white),)
                    );
                  }
                }//builder
              ),
            ]),
          ),
        )
        );
  }
}
