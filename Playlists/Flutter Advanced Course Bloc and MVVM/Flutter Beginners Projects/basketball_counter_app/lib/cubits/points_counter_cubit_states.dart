part of 'points_counter_cubit.dart';

abstract class PointsCounterState {}

class PointsCounterInitialState extends PointsCounterState {}

class PointsCounterUpdateState extends PointsCounterState {
  final int number;

  PointsCounterUpdateState({required this.number});
}

class PointsCounterResetState extends PointsCounterState {}
