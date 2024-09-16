// ignore_for_file: avoid_print

import 'package:geolocator/geolocator.dart';

Future <Position> get determinePosition async {
    bool serviceEnabled ;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if(!serviceEnabled){
      print('dained');
      return Future.error('Location services are disabled.');
    }
    
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      print('Location access dained');
      return Future.error('Location permissions are denied');
    }
  }
    if (permission == LocationPermission.deniedForever) {
      print('Location access denied forever');
      return Future.error('Location permissions are permentaily denied');
  }
  else
   {
    print('Access granted');
    Position position = await Geolocator.getCurrentPosition();
    return position;
    
   }
    
 }
