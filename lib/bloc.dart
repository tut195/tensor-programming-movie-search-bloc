import 'dart:async';

import 'model.dart';

import 'package:rxdart/rxdart.dart';

class MovieBloc{
  final API api;

  Stream<List<Movie>> _results = Stream.empty();
  Stream<String> _log = Stream.empty();

  // Если мы хотим использовать Dart vj;tv заменить на StreamController??
  ReplaySubject<String> _query = ReplaySubject<String>();

  Stream<String> get log => _log;
  Stream<List<Movie>> get results => _results;
  Sink<String> get query => _query;

  MovieBloc(this.api){
    _results = _query.distinct().asyncMap(api.get).asBroadcastStream();

    _log = Observable(results)
      .withLatestFrom(_query.stream, (_, query) => 'Results for $query')
      .asBroadcastStream();
  }

  void dispose(){
    _query.close();
  }
}