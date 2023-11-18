import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cuibts/get_weather_cuibit/get_weather_cubit.dart';
import 'package:weather_app/cuibts/get_weather_cuibit/get_weather_states.dart';
import 'package:weather_app/widgets/Weather_Info_Body.dart';
import 'package:weather_app/widgets/no_weather_body.dart';

import 'search_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const SearchView();
                    },
                  ),
                );
              },
              icon: const Icon(
                Icons.search,
              ))
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherInitialState) {
            return const NoWeatherBody();
          } else if (state is WeatherLoadedState) {
            return WeatherInfoBody(
              weather: state.weatherModel,
            );
          } else
            return Text('oops there was an error');
        },
      ),
    );
  }
}



// create states
// create cubit
// create function
// provide cubit
// integrate cubit
// trigger cubit