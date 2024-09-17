import 'dart:math';

import 'package:calculator_redux/Redux/state.dart';
import 'package:flutter/material.dart';

import 'actions.dart';

AppState appReducer(AppState state, dynamic action) {
  if (action is SetRouteAction) {
    return AppState(currentRoute: action.newRoute);
  }
  return state;
}

//BangunDatar
StateBangunDatar bangunDatarReducer(
    StateBangunDatar stateBgnDatar, dynamic action) {
  if (action is CalculateSquareValue) {
    final result = 4 * action.side;
    return StateBangunDatar(value: result);
  } else if (action is CalculateRectangleValue) {
    final result = 2 * (action.length + action.width);
    return StateBangunDatar(value: result);
  } else if (action is CalculateTriangleValue) {
    final result = action.side1 + action.side2 + action.side3;
    return StateBangunDatar(value: result);
  }
  return stateBgnDatar;
}

//Aritmatik
StateAritmatik aritmatikReducer(
    StateAritmatik stateAritmatika, dynamic action) {
  if (action is UpdateResultAction) {
    return StateAritmatik(result: action.value);
  }
  return stateAritmatika;
}

//Bangun Ruang
StateBangunRuang shapeReducer(StateBangunRuang stateBgnRuang, dynamic action) {
  if (action is CalculateBoxValue) {
    final result = 4 * (action.panjang + action.lebar + action.tinggi);
    return StateBangunRuang(value: result);
  } else if (action is CalculateCubeValue) {
    final result = 12 * action.sisi;
    return StateBangunRuang(value: result);
  } else if (action is CalculateTubeValue) {
    final result = 2 * (3.14 * action.jariJari + action.tinggi);
    return StateBangunRuang(value: result);
  }

  return stateBgnRuang;
}

StatePerpangkatan perpangkatanReducer(
    StatePerpangkatan statePerpangkatan, dynamic action) {
  if (action is ResultPerpangkatan) {
    return StatePerpangkatan(value: action.result);
  }
  return statePerpangkatan;
}
