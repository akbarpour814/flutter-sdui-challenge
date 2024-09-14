part of 'get_cars_bloc.dart';

@immutable
sealed class GetCarsEvent {}

class GetCarsRequestEvent extends GetCarsEvent{}