import 'package:bloc_pattern_apllication/model.dart';
import 'package:flutter/widgets.dart';

import 'bloc.dart';

class MovieProvider extends InheritedWidget {
  final MovieBloc movieBloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static MovieBloc of(BuildContext context) => (context.inheritFromWidgetOfExactType(MovieProvider) as MovieProvider).movieBloc;

  MovieProvider({Key key, MovieBloc movieBloc, Widget child})
      : this.movieBloc = movieBloc ?? MovieBloc(API()),
        super(child: child, key: key);
}
