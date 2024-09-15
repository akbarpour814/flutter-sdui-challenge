part of 'delete_car_bloc.dart';

@immutable
sealed class DeleteCarEvent {}

class DeleteCarRequestEvent extends DeleteCarEvent {
  final int id;

  DeleteCarRequestEvent({required this.id});
}
