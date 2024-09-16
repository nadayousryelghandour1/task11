import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wheather_app/bloc/search/bloc/search_weather_bloc.dart';
import 'package:wheather_app/screens/search_screen.dart';

// String query ='';

class WeatherSearchDelegate extends SearchDelegate<String?> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }


  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.navigate_before),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Show the search results here
    if (query.isNotEmpty) {
      // Call the weather API with the search query (city name)
      return BlocProvider<SearchWeatherBloc>(
        create: (context) => SearchWeatherBloc()..add(
          FetchWeatherSearch(city: query)
        ),
        
        child: const SearchScreen(),
      );
  } else {
    return const Center(
      child: Text('Please enter a search query',
      style: TextStyle(fontSize: 20, color: Colors.white),),
    );
  }
  
    }
    
      @override
      Widget buildSuggestions(BuildContext context) {
     return const Center(
      child: Text('Search suggestions will be displayed here',
      style: TextStyle(fontSize: 20, color: Colors.black),),
    );
      }
  }
  