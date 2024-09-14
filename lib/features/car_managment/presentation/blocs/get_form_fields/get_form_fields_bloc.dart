import 'package:bloc/bloc.dart';
import 'package:flutter_sdui_challenge/core/utils/data_states.dart';
import 'package:flutter_sdui_challenge/features/car_managment/data/models/form_fields_response_model/form_fields_response_model.dart';
import 'package:flutter_sdui_challenge/features/car_managment/domain/use_cases/get_form_fields_use_case.dart';
import 'package:meta/meta.dart';

part 'get_form_fields_event.dart';
part 'get_form_fields_state.dart';

class GetFormFieldsBloc extends Bloc<GetFormFieldsEvent, GetFormFieldsState> {
  GetFormFieldsBloc() : super(GetFormFieldsInitial()) {
    on<GetFormFieldsRequestEvent>((event, emit) async {
      emit(GetFormFieldsLoading());
      final state = await GetFormFieldsUseCase().call();
      if (state is DataSuccess) {
        emit(GetFormFieldsLoaded(formFields: state.data!));
      } else {
        emit(GetFormFieldsError(message: state.error!));
      }
    });
  }
}
