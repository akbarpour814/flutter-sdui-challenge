part of 'add_new_car_bloc.dart';

@immutable
sealed class AddNewCarState {}

final class AddNewCarInitial extends AddNewCarState {}

final class AddNewCarLoading extends AddNewCarState {}

final class AddNewCarSuccess extends AddNewCarState {}

final class AddNewCarError extends AddNewCarState {
  final String message;

  AddNewCarError({required this.message});
}
