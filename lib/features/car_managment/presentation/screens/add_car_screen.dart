import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sdui_challenge/features/car_managment/presentation/blocs/get_form_fields/get_form_fields_bloc.dart';
import 'package:flutter_sdui_challenge/features/car_managment/presentation/widgets/form_generator_widget.dart';
import 'package:flutter_sdui_challenge/features/car_managment/presentation/widgets/retry_btn.dart';

class AddCarScreen extends StatelessWidget {
  const AddCarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ثبت خودرو'),
      ),
      body: BlocProvider(
        create: (context) =>
            GetFormFieldsBloc()..add(GetFormFieldsRequestEvent()),
        child: BlocBuilder<GetFormFieldsBloc, GetFormFieldsState>(
          builder: (context, getFormFieldsState) {
            return switch (getFormFieldsState) {
              GetFormFieldsLoaded() =>
                (getFormFieldsState.formFields.fields ?? []).isNotEmpty
                    ? Column(
                        children: [
                          FormGeneratorWidget(
                            formFields: getFormFieldsState.formFields,
                          ),
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
    );
  }
}
