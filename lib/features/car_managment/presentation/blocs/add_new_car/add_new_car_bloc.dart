import 'package:bloc/bloc.dart';
import 'package:flutter_sdui_challenge/core/utils/data_states.dart';
import 'package:flutter_sdui_challenge/features/car_managment/data/models/car_attribute_model.dart';
import 'package:flutter_sdui_challenge/features/car_managment/domain/use_cases/add_new_car_use_case.dart';
import 'package:meta/meta.dart';

part 'add_new_car_event.dart';
part 'add_new_car_state.dart';

class AddNewCarBloc extends Bloc<AddNewCarEvent, AddNewCarState> {
  AddNewCarBloc() : super(AddNewCarInitial()) {
    on<AddNewCarRequestEvent>((event, emit) async {
      emit(AddNewCarLoading());
      final state = await AddNewCarUseCase().call(event.request);
      if (state is DataSuccess) {
        emit(AddNewCarSuccess());
      } else {
        emit(AddNewCarError(message: state.error!));
      }
    });
  }
}
