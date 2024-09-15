import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sdui_challenge/configs/gen/assets.gen.dart';
import 'package:flutter_sdui_challenge/core/utils/extentions.dart';

class DataEmptyWidget extends StatelessWidget {
  final Function() onCreate;
  const DataEmptyWidget({
    super.key,
    required this.onCreate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Assets.resource.addItemVector.svg(width: 50.w(context)),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('تاکنون خودرویی ثبت نکرده اید')],
        ),
        24.hsb(),
        SizedBox(
          width: 40.w(context),
          child: ElevatedButton(
              onPressed: onCreate,
              child: const Text('ثبت خودرو',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold))),
        )
      ],
    );
  }
}
