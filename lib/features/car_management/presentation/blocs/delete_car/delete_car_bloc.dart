import 'package:bloc/bloc.dart';
import 'package:flutter_sdui_challenge/core/utils/data_states.dart';
import 'package:flutter_sdui_challenge/features/car_management/domain/use_cases/delete_car_use_case.dart';
import 'package:meta/meta.dart';

part 'delete_car_event.dart';
part 'delete_car_state.dart';

class DeleteCarBloc extends Bloc<DeleteCarEvent, DeleteCarState> {
  DeleteCarBloc() : super(DeleteCarInitial()) {
    on<DeleteCarRequestEvent>((event, emit) async {
      emit(DeleteCarLoading());
      final state = await DeleteCarUseCase().call(event.id);
      if (state is DataSuccess) {
        emit(DeleteCarSuccess());
      } else {
        emit(DeleteCarError(message: state.error!));
      }
    });
  }
}
