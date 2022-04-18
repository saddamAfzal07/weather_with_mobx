// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$WeatherApp on Weather, Store {
  final _$cityNameAtom = Atom(name: 'Weather.cityName');

  @override
  String get cityName {
    _$cityNameAtom.reportRead();
    return super.cityName;
  }

  @override
  set cityName(String value) {
    _$cityNameAtom.reportWrite(value, super.cityName, () {
      super.cityName = value;
    });
  }

  final _$loadingAtom = Atom(name: 'Weather.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$WeatherActionController = ActionController(name: 'Weather');

  @override
  dynamic searchCity(String name) {
    final _$actionInfo =
        _$WeatherActionController.startAction(name: 'Weather.searchCity');
    try {
      return super.searchCity(name);
    } finally {
      _$WeatherActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cityName: ${cityName},
loading: ${loading}
    ''';
  }
}
