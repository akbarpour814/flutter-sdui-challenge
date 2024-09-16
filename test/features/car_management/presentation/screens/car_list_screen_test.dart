import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_sdui_challenge/configs/di.dart';
import 'package:flutter_sdui_challenge/core/utils/data_states.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/get_cars_response_model.dart';
import 'package:flutter_sdui_challenge/features/car_management/domain/repository/car_management_repository.dart';
import 'package:flutter_sdui_challenge/features/car_management/presentation/blocs/get_cars/get_cars_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sdui_challenge/features/car_management/presentation/screens/car_list_screen.dart';
import 'package:mockito/mockito.dart';

import '../../../../mocked/mocked_data_test.mocks.dart';

void main() {
  group('CarListScreen render test', () {
    final MockICarManagementRepository mockICarManagementRepository =
        MockICarManagementRepository();
    late GetCarsBloc bloc;

    setUpAll(() {
      getIt.registerSingleton<ICarManagementRepository>(
          mockICarManagementRepository);
      bloc = GetCarsBloc();
    });

    tearDownAll(() {
      getIt.reset();
    });

    blocTest<GetCarsBloc, GetCarsState>(
      'emits [isA<GetCarsBlocLoading>(), isA<GetCarsBlocLoaded>()] when GetCarsBlocRequestEvent is added and call is successful',
      build: () {
        final mockResponse =
            DataSuccess<List<GetCarsResponseModel>>([]);
        when(mockICarManagementRepository.getAllCars())
            .thenAnswer((_) async => mockResponse);
        return bloc;
      },
      act: (bloc) => bloc.add(GetCarsRequestEvent()),
      expect: () => [
        isA<GetCarsLoading>(),
        isA<GetCarsLoaded>(),
      ],
    );


    testWidgets('CarListScreen renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(
        home: CarListScreen(),
      ));
      expect(find.byType(FloatingActionButton), findsOneWidget);
    });
  });
}
