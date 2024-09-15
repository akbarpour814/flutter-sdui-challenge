import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sdui_challenge/features/car_management/presentation/blocs/get_cars/get_cars_bloc.dart';
import 'package:flutter_sdui_challenge/features/car_management/presentation/blocs/delete_car/delete_car_bloc.dart';
import 'package:flutter_sdui_challenge/features/car_management/presentation/screens/add_car_screen.dart';
import 'package:flutter_sdui_challenge/features/car_management/presentation/widgets/car_item.dart';
import 'package:flutter_sdui_challenge/features/car_management/presentation/widgets/data_empty_widget.dart';
import 'package:flutter_sdui_challenge/features/car_management/presentation/widgets/retry_btn.dart';

class CarListScreen extends StatefulWidget {
  const CarListScreen({super.key});

  @override
  State<CarListScreen> createState() => _CarListScreenState();
}

class _CarListScreenState extends State<CarListScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetCarsBloc()..add(GetCarsRequestEvent()),
        ),
        BlocProvider(
          create: (context) => DeleteCarBloc(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('لیست خودرو های شما'),
        ),
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => Directionality(
                        textDirection: TextDirection.rtl,
                        child: AddCarScreen(
                          onAdded: () {
                            Navigator.pop(ctx);
                            BlocProvider.of<GetCarsBloc>(context)
                                .add(GetCarsRequestEvent());
                          },
                        )),
                  ));
            },
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          );
        }),
        body: BlocBuilder<GetCarsBloc, GetCarsState>(
          builder: (context, getCarsState) {
            return switch (getCarsState) {
              GetCarsLoaded() => getCarsState.data.isNotEmpty
                  ? ListView(
                      physics: const BouncingScrollPhysics(),
                      cacheExtent: 1000,
                      padding: const EdgeInsets.fromLTRB(12, 12, 12, 80),
                      children: getCarsState.data.reversed
                          .map((e) => CarItem(car: e))
                          .toList())
                  : DataEmptyWidget(
                      onCreate: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (ctx) => Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: AddCarScreen(
                                    onAdded: () {
                                      Navigator.pop(ctx);
                                      BlocProvider.of<GetCarsBloc>(context)
                                          .add(GetCarsRequestEvent());
                                    },
                                  )),
                            ));
                      },
                    ),
              GetCarsError() => RetryBtn(
                  errorMessage: 'خطا در دریافت اطلاعات',
                  onRetry: () {
                    BlocProvider.of<GetCarsBloc>(context)
                        .add(GetCarsRequestEvent());
                  },
                ),
              GetCarsLoading() => Center(
                  child: CupertinoActivityIndicator(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              GetCarsInitial() => const Center(),
            };
          },
        ),
      ),
    );
  }
}
