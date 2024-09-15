part of 'get_cars_bloc.dart';

@immutable
sealed class GetCarsState {}

final class GetCarsInitial extends GetCarsState {}

final class GetCarsLoading extends GetCarsState {}

final class GetCarsLoaded extends GetCarsState {
  final List<GetCarsResponseModel> data;

  GetCarsLoaded({required this.data});
}

final class GetCarsError extends GetCarsState {}
