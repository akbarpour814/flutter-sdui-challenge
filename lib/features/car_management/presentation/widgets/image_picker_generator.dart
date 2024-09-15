import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_sdui_challenge/core/utils/extentions.dart';
import 'package:flutter_sdui_challenge/core/widgets/animated_expanded_widget.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/models/form_fields_response_model/field_model.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerGenerator extends StatefulWidget {
  final FieldModel item;
  final ScrollController scrollController;
  const ImagePickerGenerator({
    super.key,
    required this.item,
    required this.scrollController,
  });

  @override
  State<ImagePickerGenerator> createState() => _ImagePickerGeneratorState();
}

class _ImagePickerGeneratorState extends State<ImagePickerGenerator> {
  ImagePicker _imagePicker = ImagePicker();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(double.parse(
              (widget.item.style?.margin ?? '10').replaceAll('px 0', ''))),
          width: double.infinity,
          child: ElevatedButton.icon(
              style: ButtonStyle(
                  elevation: const WidgetStatePropertyAll(0),
                  backgroundColor:
                      const WidgetStatePropertyAll(Colors.transparent),
                  shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side:
                          BorderSide(color: Theme.of(context).primaryColor)))),
              onPressed: () async {
                if (widget.item.props?.multiple ?? false) {
                  final files = await _imagePicker.pickMultiImage();
                  if (files.isNotEmpty) {
                    widget.item.selectedFiles = files;
                  }
                } else {
                  final xfile =
                      await _imagePicker.pickImage(source: ImageSource.gallery);
                  if (xfile != null) {
                    widget.item.selectedFiles = [xfile];
                  }
                }
                setState(() {});
                Future.delayed(const Duration(milliseconds: 500)).then(
                    (value) => widget.scrollController.animateTo(
                        widget.scrollController.position.maxScrollExtent,
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.ease));
              },
              icon: Icon(
                Icons.add_photo_alternate_outlined,
                color: Theme.of(context).primaryColor,
                size: 20,
              ),
              iconAlignment: IconAlignment.end,
              label: Text(
                widget.item.label ?? 'آپلود فایل',
                style: TextStyle(color: Theme.of(context).primaryColor),
              )),
        ),
        if ((widget.item.selectedFiles ?? []).isNotEmpty)
          AnimatedExpandedWidget(
              expand: true,
              child: GridView.count(
                  crossAxisCount: 3,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  padding: EdgeInsets.symmetric(
                      horizontal: double.parse(
                          (widget.item.style?.margin ?? '10')
                              .replaceAll('px 0', ''))),
                  children: widget.item.selectedFiles!
                      .map((e) => Container(
                            width: 30.w(context),
                            height: 30.w(context),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    width: 2,
                                    color: (5 * 1024 * 1024) >=
                                            File(e.path).lengthSync()
                                        ? Theme.of(context).primaryColor
                                        : Colors.red),
                                borderRadius: BorderRadius.circular(6),
                                image: DecorationImage(
                                    image: FileImage(File(e.path)),
                                    fit: BoxFit.cover)),
                          ))
                      .toList()))
      ],
    );
  }
}
