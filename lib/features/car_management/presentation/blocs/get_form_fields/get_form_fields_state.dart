part of 'get_form_fields_bloc.dart';

@immutable
sealed class GetFormFieldsState {}

final class GetFormFieldsInitial extends GetFormFieldsState {}

final class GetFormFieldsLoading extends GetFormFieldsState {}

final class GetFormFieldsLoaded extends GetFormFieldsState {
  final FormFieldsResponseModel formFields;

  GetFormFieldsLoaded({required this.formFields});
}

final class GetFormFieldsError extends GetFormFieldsState {
  final String message;

  GetFormFieldsError({required this.message});
}
