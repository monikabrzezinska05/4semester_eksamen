import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mob_dev/home_bloc/home_cubit.dart';
import 'package:mob_dev/utillities.dart';

import 'authentication_bloc/authentication_cubit.dart';
import 'home_bloc/home_state.dart';
import 'indicator_headline_widget.dart';
import 'indicator_lines.dart';
import 'main.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final channel = context.read<BroadcastWsChannel>();
    final authentication = context.read<AuthenticationCubit>();
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(channel)..init(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final units = state.units.entries.toList();
          final homeCubit = context.read<HomeCubit>();
          return ListView.builder(
            itemCount: units.length,
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  IndicatorHeadline(headline: units[index].key.name, status: units[index].value[0].status, units: units[index].value),
                  ...units[index].value.map((unit) =>
                     IndicatorLine(unitName: unit.name, unitStatus: unit.status)),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
