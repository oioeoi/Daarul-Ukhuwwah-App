import 'package:flutter_bloc/flutter_bloc.dart';

class CurDots extends Cubit<int> {
  CurDots(super.initialState, this.init);

  final int init;

  stremDot() => emit(state);
}
