part of 'delete_car_bloc.dart';

@immutable
sealed class DeleteCarState {}

final class DeleteCarInitial extends DeleteCarState {}

final class DeleteCarLoading extends DeleteCarState {
  final int id;

  DeleteCarLoading({required this.id});
}

final class DeleteCarSuccess extends DeleteCarState {}

final class DeleteCarError extends DeleteCarState {
  final String message;

  DeleteCarError({required this.message});
}
