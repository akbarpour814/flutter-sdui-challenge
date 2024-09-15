import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sdui_challenge/core/utils/extentions.dart';
import 'package:flutter_sdui_challenge/core/widgets/custom_modals.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/get_cars_response_model.dart';
import 'package:flutter_sdui_challenge/features/car_management/presentation/blocs/delete_car/delete_car_bloc.dart';

class CarItem extends StatelessWidget {
  final GetCarsResponseModel car;
  final Function() onDeleteItem;
  const CarItem({super.key, required this.car, required this.onDeleteItem});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DeleteCarBloc(),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            if (car.data.any((element) => element.attrValue.isNotNullOrEmpty))
              ...car.data
                  .where((element) => element.attrValue.isNotNullOrEmpty)
                  .map(
                    (e) => _rowItem(
                      title: e.attrLabel ?? '',
                      value: e.attrValue ?? '',
                    ),
                  ),
            if (car.data.any((element) => (element.fileBytes ?? []).isNotEmpty))
              ...car.data
                  .where((element) => (element.fileBytes ?? []).isNotEmpty)
                  .map((e) => Column(
                        children: [
                          _rowItem(title: e.attrLabel ?? '', value: ''),
                          6.hsb(),
                          Row(
                            children: [
                              Expanded(
                                child: Wrap(
                                    spacing: 8,
                                    runSpacing: 8,
                                    children: e.fileBytes!
                                        .map(
                                          (e1) => ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              child: Container(
                                                width: 20.w(context),
                                                height: 20.w(context),
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        width: 2,
                                                        color: Theme.of(context)
                                                            .primaryColor),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            4),
                                                    image: DecorationImage(
                                                        image: MemoryImage(
                                                          e1,
                                                        ),
                                                        fit: BoxFit.cover)),
                                              )),
                                        )
                                        .toList()),
                              ),
                            ],
                          ),
                          BlocConsumer<DeleteCarBloc, DeleteCarState>(
                            listener: (context, state) {
                              if (state is DeleteCarSuccess) {
                                onDeleteItem();
                              }
                              if (state is DeleteCarError) {
                                CustomModal.showError(context, state.message);
                              }
                            },
                            builder: (context, state) {
                              return Container(
                                width: double.infinity,
                                margin: const EdgeInsets.only(top: 16),
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        elevation:
                                            const WidgetStatePropertyAll(0),
                                        backgroundColor:
                                            const WidgetStatePropertyAll(
                                                Colors.transparent),
                                        shape: WidgetStatePropertyAll(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                side: BorderSide(
                                                    color: Theme.of(context)
                                                        .primaryColor)))),
                                    onPressed: () {
                                      if (state is! DeleteCarLoading) {
                                        BlocProvider.of<DeleteCarBloc>(context)
                                            .add(DeleteCarRequestEvent(
                                                id: car.id));
                                      }
                                    },
                                    child: state is DeleteCarLoading &&
                                            state.id == car.id
                                        ? CupertinoActivityIndicator(
                                            color:
                                                Theme.of(context).primaryColor)
                                        : Text(
                                            'حذف خودرو',
                                            style: TextStyle(
                                                color: Theme.of(context)
                                                    .primaryColor),
                                          )),
                              );
                            },
                          )
                        ],
                      ))
          ],
        ),
      ),
    );
  }
}

class _rowItem extends StatelessWidget {
  final String title;
  final String value;
  const _rowItem({
    super.key,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: Text(
            title,
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          )),
          8.wsb(),
          Expanded(
              child: Text(
            value,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ))
        ],
      ),
    );
  }
}
