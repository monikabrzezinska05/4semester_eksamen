import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_dev/home_bloc/home_cubit.dart';

import 'home_bloc/home_state.dart';
import 'indicator_headline_widget.dart';
import 'indicator_lines.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final units = state.units.entries.toList();
          return ListView.builder(
            itemCount: units.length,
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  IndicatorHeadline(headline: units[index].key),
                  ...units[index].value.map((unit) =>
                     IndicatorLine(unitName: unit.name)),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
