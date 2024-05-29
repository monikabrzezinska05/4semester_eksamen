import 'package:flutter/material.dart';
import 'package:mob_dev/models/unit/unit_model.dart';

Color statusColors(Status status) {
  Color color;
  if(status == Status.Armed || status == Status.Closed) {
    color = Colors.green;
  } else if (status == Status.Disarmed || status == Status.Open) {
    color = Colors.yellow;
  } else if (status == Status.Triggered){
    color = Colors.red;
  } else {
    color = Colors.black;
  }
  return color;
}

Color headlineStatusColor(Status status, UnitType unitType, List<UnitModel> units) {
  Color color;
  var statusYellow = units.where((unit) => unit.unitType == unitType && unit.status == Status.Disarmed || unit.status == Status.Open);
  var statusRed = units.where((unit) => unit.unitType == unitType && unit.status == Status.Triggered);
  if (statusRed.isNotEmpty) {
    color = Colors.red;
  }
  else if (statusYellow.isNotEmpty) {
    color = Colors.yellow;
  }
  else {
    color = Colors.green;
  }
  return color;

}