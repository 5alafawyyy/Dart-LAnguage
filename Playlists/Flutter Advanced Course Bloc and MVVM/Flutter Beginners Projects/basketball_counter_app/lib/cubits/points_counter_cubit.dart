import 'package:flutter_bloc/flutter_bloc.dart';
part 'points_counter_cubit_states.dart';

class PointsCounterCubit extends Cubit<PointsCounterState> {
  PointsCounterCubit() : super(PointsCounterInitialState());

  int teamAPoints = 0;

  int teamBPoints = 0;

  void incrementTeamA(int number) {
    teamAPoints += number;
    emit(PointsCounterUpdateState(number: number));
  }

  void incrementTeamB(int number) {
    teamBPoints += number;
    emit(PointsCounterUpdateState(number: number));
  }

  void resetCounters() {
    teamAPoints = 0;
    teamBPoints = 0;
    emit(PointsCounterResetState());
  }
}
