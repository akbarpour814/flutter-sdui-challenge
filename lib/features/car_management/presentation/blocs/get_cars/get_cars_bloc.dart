import 'package:bloc/bloc.dart';
import 'package:flutter_sdui_challenge/core/utils/data_states.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/get_cars_response_model.dart';
import 'package:flutter_sdui_challenge/features/car_management/domain/use_cases/get_all_cars_use_case.dart';
import 'package:meta/meta.dart';

part 'get_cars_event.dart';
part 'get_cars_state.dart';

class GetCarsBloc extends Bloc<GetCarsEvent, GetCarsState> {
  GetCarsBloc() : super(GetCarsInitial()) {
    on<GetCarsRequestEvent>((event, emit) async {
      emit(GetCarsLoading());
      final state = await GetAllCarsUseCase().call();
      if (state is DataSuccess) {
        emit(GetCarsLoaded(data: state.data!));
      } else {
        emit(GetCarsError());
      }
    });
  }
}
