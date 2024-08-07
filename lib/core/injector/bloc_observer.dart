// ignore_for_file: avoid_print

import 'package:flutter_bloc/flutter_bloc.dart';

class TwitterXBlocObserver extends BlocObserver {
  const TwitterXBlocObserver();

  @override
  void onEvent(Bloc<dynamic, dynamic> bloc, Object? event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onChange(BlocBase<dynamic> bloc, Change change) {
    super.onChange(bloc, change);
    print(change);
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(Bloc<dynamic, dynamic> bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}
