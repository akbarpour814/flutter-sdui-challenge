import 'package:flutter_sdui_challenge/features/car_management/data/models/form_fields_response_model/form_fields_response_model.dart';
import 'package:flutter_sdui_challenge/features/car_management/domain/repository/car_management_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_sdui_challenge/features/car_management/domain/use_cases/get_form_fields_use_case.dart';
import 'package:flutter_sdui_challenge/core/utils/data_states.dart';
import 'package:flutter_sdui_challenge/configs/di.dart';

import '../../../../mocked/mocked_data_test.mocks.dart';

void main() {
  late MockICarManagementRepository mockICarManagementRepository;
  late GetFormFieldsUseCase getformfieldsusecase;

  setUp(() {
    mockICarManagementRepository = MockICarManagementRepository();
    getformfieldsusecase = GetFormFieldsUseCase();
    getIt.registerFactory<ICarManagementRepository>(
        () => mockICarManagementRepository);
  });

  tearDown(() {
    getIt.reset();
  });

  group('GetFormFieldsUseCase tests', () {
    test('should return DataSuccess when repository call is successful',
        () async {
      final expectedResponse = DataSuccess<FormFieldsResponseModel>(
          FormFieldsResponseModel.fromJson({}));

      when(mockICarManagementRepository.getFormFields())
          .thenAnswer((_) async => expectedResponse);

      final result = await getformfieldsusecase.call();

      expect(result, isA<DataSuccess>());
      verify(mockICarManagementRepository.getFormFields()).called(1);
    });

    test('should return DataError when repository call fails', () async {
      final expectedResponse = DataError<FormFieldsResponseModel>('Error');

      when(mockICarManagementRepository.getFormFields())
          .thenAnswer((_) async => expectedResponse);

      final result = await getformfieldsusecase.call();

      expect(result, isA<DataError>());
      verify(mockICarManagementRepository.getFormFields()).called(1);
    });
  });
}
