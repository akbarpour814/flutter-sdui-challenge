part of 'add_new_car_bloc.dart';

@immutable
sealed class AddNewCarEvent {}

class AddNewCarRequestEvent extends AddNewCarEvent{
  final List<CarAttributeModel> request;

  AddNewCarRequestEvent({required this.request});
}