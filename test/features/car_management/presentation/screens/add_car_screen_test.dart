import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_sdui_challenge/configs/di.dart';
import 'package:flutter_sdui_challenge/core/utils/data_states.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/form_fields_response_model/form_fields_response_model.dart';
import 'package:flutter_sdui_challenge/features/car_management/domain/repository/car_management_repository.dart';
import 'package:flutter_sdui_challenge/features/car_management/presentation/blocs/add_new_car/add_new_car_bloc.dart';
import 'package:flutter_sdui_challenge/features/car_management/presentation/blocs/get_form_fields/get_form_fields_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sdui_challenge/features/car_management/presentation/screens/add_car_screen.dart';
import 'package:mockito/mockito.dart';

import '../../../../mocked/mocked_data_test.mocks.dart';

void main() {
  group('AddCarScreen render test', () {
    final MockICarManagementRepository mockICarManagementRepository =
        MockICarManagementRepository();
    late GetFormFieldsBloc bloc;
    late AddNewCarBloc addNewCarBloc;

    setUpAll(() {
      getIt.registerSingleton<ICarManagementRepository>(
          mockICarManagementRepository);
      bloc = GetFormFieldsBloc();
      addNewCarBloc = AddNewCarBloc();
    });

    tearDownAll(() {
      getIt.reset();
    });

    blocTest<GetFormFieldsBloc, GetFormFieldsState>(
      'emits [isA<GetFormFieldsLoading>(), isA<GetFormFieldsLoaded>()] when GetFormFieldsRequestEvent is added and call is successful',
      build: () {
        final mockResponse =
            DataSuccess(FormFieldsResponseModel.fromJson({"": ""}));
        when(mockICarManagementRepository.getFormFields())
            .thenAnswer((_) async => mockResponse);
        return bloc;
      },
      act: (bloc) => bloc.add(GetFormFieldsRequestEvent()),
      expect: () => [
        isA<GetFormFieldsLoading>(),
        isA<GetFormFieldsLoaded>(),
      ],
    );

    blocTest<AddNewCarBloc, AddNewCarState>(
    'emits [isA<AddNewCarLoading>(), isA<AddNewCarSuccess>()] when AddNewCarRequestEvent is added and call is successful',
    build: () {
      final mockResponse = DataSuccess(null);
      when(mockICarManagementRepository.addNewCar(any))
          .thenAnswer((_) async => mockResponse);
      return addNewCarBloc;
    },
    act: (addNewCarBloc) => addNewCarBloc.add(AddNewCarRequestEvent(request : const [])),
    expect: () => [
      isA<AddNewCarLoading>(), isA<AddNewCarSuccess>(),
    ],
  );


    testWidgets('AddCarScreen renders correctly', (WidgetTester tester) async {
      
      await tester.pumpWidget(MaterialApp(
        home: AddCarScreen(onAdded: () {}),
      ));
       expect(find.byType(Form), findsOneWidget);
    });
  });
}
