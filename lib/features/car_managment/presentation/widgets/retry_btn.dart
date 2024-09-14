
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_sdui_challenge/configs/gen/assets.gen.dart';
import 'package:flutter_sdui_challenge/core/utils/extentions.dart';

class RetryBtn extends StatelessWidget {
  final String errorMessage;
  final Function() onRetry;
  const RetryBtn({
    super.key,
    required this.onRetry,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Assets.resource.errorVector.svg(width: 50.w(context)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text(errorMessage)],
        ),
        24.hsb(),
        SizedBox(
          width: 40.w(context),
          child: ElevatedButton(
              onPressed: onRetry,
              child: const Text('تلاش مجدد',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold))),
        )
      ],
    );
  }
}
