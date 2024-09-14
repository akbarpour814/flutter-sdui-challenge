import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sdui_challenge/core/widgets/custom_modals.dart';
import 'package:flutter_sdui_challenge/features/car_managment/data/models/car_attribute_model.dart';
import 'package:flutter_sdui_challenge/features/car_managment/presentation/blocs/add_new_car/add_new_car_bloc.dart';
import 'package:flutter_sdui_challenge/features/car_managment/presentation/blocs/get_form_fields/get_form_fields_bloc.dart';
import 'package:flutter_sdui_challenge/features/car_managment/presentation/widgets/form_generator_widget.dart';
import 'package:flutter_sdui_challenge/features/car_managment/presentation/widgets/retry_btn.dart';

class AddCarScreen extends StatefulWidget {
  final Function() onAdded;
  const AddCarScreen({super.key, required this.onAdded});

  @override
  State<AddCarScreen> createState() => _AddCarScreenState();
}

class _AddCarScreenState extends State<AddCarScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ثبت خودرو'),
      ),
      body: Form(
        key: _formKey,
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) =>
                  GetFormFieldsBloc()..add(GetFormFieldsRequestEvent()),
            ),
            BlocProvider(
              create: (context) => AddNewCarBloc(),
            ),
          ],
          child: BlocBuilder<GetFormFieldsBloc, GetFormFieldsState>(
            builder: (context, getFormFieldsState) {
              return switch (getFormFieldsState) {
                GetFormFieldsLoaded() => (getFormFieldsState
                                .formFields.fields ??
                            [])
                        .isNotEmpty
                    ? Column(
                        children: [
                          FormGeneratorWidget(
                            formFields: getFormFieldsState.formFields,
                          ),
                          BlocConsumer<AddNewCarBloc, AddNewCarState>(
                            listener: (context, addNewCarState) {
                              if (addNewCarState is AddNewCarSuccess) {
                                widget.onAdded();
                              }
                              if (addNewCarState is AddNewCarError) {
                                CustomModal.showError(
                                    context, addNewCarState.message);
                              }
                            },
                            builder: (context, addNewCarState) {
                              return Container(
                                width: double.infinity,
                                margin: const EdgeInsets.all(12),
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        shape: WidgetStatePropertyAll(
                                            RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8)))),
                                    onPressed: () {
                                      if (addNewCarState is! AddNewCarLoading) {
                                        if (_formKey.currentState!.validate()) {
                                          final fileErrorMsg =
                                              _checkFileValidation(
                                                  getFormFieldsState);
                                          if (fileErrorMsg == null) {
                                            List<CarAttributeModel>
                                                requestList = [];
                                            for (var element
                                                in getFormFieldsState
                                                    .formFields.fields!) {
                                              requestList.add(CarAttributeModel(
                                                  attrName: element.name,
                                                  attrValue: element
                                                          .selectedOptions
                                                          ?.value ??
                                                      element.controller.text
                                                          .trim(),
                                                  images: element.selectedFiles
                                                      ?.map(
                                                        (e) => File(e.path),
                                                      )
                                                      .toList()));
                                              BlocProvider.of<AddNewCarBloc>(
                                                      context)
                                                  .add(AddNewCarRequestEvent(
                                                      request: requestList));
                                            }
                                          } else {
                                            CustomModal.showInfo(
                                                context, fileErrorMsg);
                                          }
                                        } else {
                                          final fileErrorMsg =
                                              _checkFileValidation(
                                                  getFormFieldsState);
                                          if (fileErrorMsg != null) {
                                            CustomModal.showInfo(
                                                context, fileErrorMsg);
                                          }
                                        }
                                      }
                                    },
                                    child: addNewCarState is AddNewCarLoading
                                        ? const CupertinoActivityIndicator(
                                            color: Colors.white,
                                          )
                                        : const Text(
                                            'ثبت',
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 16),
                                          )),
                              );
                            },
                          )
                        ],
                      )
                    : RetryBtn(
                        errorMessage: 'خطا در پردازش فرم',
                        onRetry: () {
                          BlocProvider.of<GetFormFieldsBloc>(context)
                              .add(GetFormFieldsRequestEvent());
                        },
                      ),
                GetFormFieldsError() => RetryBtn(
                    errorMessage: getFormFieldsState.message,
                    onRetry: () {
                      BlocProvider.of<GetFormFieldsBloc>(context)
                          .add(GetFormFieldsRequestEvent());
                    },
                  ),
                GetFormFieldsLoading() => Center(
                    child: CupertinoActivityIndicator(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                GetFormFieldsInitial() => const Center(),
              };
            },
          ),
        ),
      ),
    );
  }

  String? _checkFileValidation(GetFormFieldsLoaded getFormFieldsState) {
    String? errorMsg;
    if (getFormFieldsState.formFields.fields!
        .any((element) => element.type == 'file')) {
      for (var element in getFormFieldsState.formFields.fields!
          .where((element) => element.type == 'file')) {
        if ((element.selectedFiles ?? []).isEmpty) {
          errorMsg = 'حداقل یک تصویر انتخاب نمایید';
        } else if (element.props?.maxSize != null &&
            element.selectedFiles!.any((item) =>
                (int.parse(element.props!.maxSize!
                        .toLowerCase()
                        .replaceAll('mb', '')) *
                    1024 *
                    1024) <
                File(item.path).lengthSync())) {
          errorMsg =
              'حجم تصاویر نباید بیشتر از  ${int.parse(element.props!.maxSize!.toLowerCase().replaceAll('mb', ''))} مگابایت باشد';
        }
      }
    }
    return errorMsg;
  }
}
