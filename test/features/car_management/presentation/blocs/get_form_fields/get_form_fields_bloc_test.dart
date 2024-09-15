
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_sdui_challenge/configs/di.dart';
import 'package:flutter_sdui_challenge/core/utils/data_states.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/form_fields_response_model/form_fields_response_model.dart';
import 'package:flutter_sdui_challenge/features/car_management/domain/repository/car_management_repository.dart';
import 'package:flutter_sdui_challenge/features/car_management/presentation/blocs/get_form_fields/get_form_fields_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../../mocked/mocked_data_test.mocks.dart';

void main() {
  late GetFormFieldsBloc bloc;
  late MockICarManagementRepository mockRepository;

  setUp(() {
    mockRepository = MockICarManagementRepository();
    getIt.registerFactory<ICarManagementRepository>(() => mockRepository);
    bloc = GetFormFieldsBloc();
  });

  tearDown(() {
    getIt.reset();
  });

  blocTest<GetFormFieldsBloc, GetFormFieldsState>(
    'emits [isA<GetFormFieldsLoading>(), isA<GetFormFieldsLoaded>()] when GetFormFieldsRequestEvent is added and call is successful',
    build: () {
      final mockResponse = DataSuccess(FormFieldsResponseModel.fromJson({"" : ""}));
      when(mockRepository.getFormFields())
          .thenAnswer((_) async => mockResponse);
      return bloc;
    },
    act: (bloc) => bloc.add(GetFormFieldsRequestEvent()),
    expect: () => [
      isA<GetFormFieldsLoading>(), isA<GetFormFieldsLoaded>(),
    ],
  );

  blocTest<GetFormFieldsBloc, GetFormFieldsState>(
    'emits [isA<GetFormFieldsLoading>(), isA<GetFormFieldsError>()] when GetFormFieldsRequestEvent is added and call fails',
    build: () {
      final mockResponse = DataError<FormFieldsResponseModel>('error');
      when(mockRepository.getFormFields())
          .thenAnswer((_) async => mockResponse);
      return bloc;
    },
    act: (bloc) => bloc.add(GetFormFieldsRequestEvent()),
    expect: () => [
      isA<GetFormFieldsLoading>(), isA<GetFormFieldsError>(),
    ],
  );
}