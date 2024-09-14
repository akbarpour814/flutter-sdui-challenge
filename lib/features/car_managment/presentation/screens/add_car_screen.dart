import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sdui_challenge/features/car_managment/presentation/blocs/get_form_fields/get_form_fields_bloc.dart';

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
            return Column(
              children: [
                Expanded(
                  child: getFormFieldsState is GetFormFieldsLoaded
                      ? ListView(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.all(16),
                        )
                      : const Center(
                          child: const CupertinoActivityIndicator(),
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
