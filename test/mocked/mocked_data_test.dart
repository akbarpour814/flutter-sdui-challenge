
// GENERATED CODE - DO NOT MODIFY BY HAND

import 'dart:io';

import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/source/local/car_management_local_data_source.dart';
import 'package:flutter_sdui_challenge/features/car_management/data/source/remote/car_management_remote_data_source.dart';
import 'package:flutter_sdui_challenge/features/car_management/domain/repository/car_management_repository.dart';

void disableOverflowErrors() {
  FlutterError.onError = (FlutterErrorDetails details) {
    final exception = details.exception;
    final isOverflowError = exception is FlutterError &&
        !exception.diagnostics.any(
            (e) => e.value.toString().startsWith("A RenderFlex overflowed by"));

    if (isOverflowError) {
      null;
    } else {
      FlutterError.presentError(details);
    }
  };
}

@GenerateMocks([
  Dio,
  ICarManagementLocalDataSource,
  ICarManagementRemoteDataSource,
  ICarManagementRepository,
  Box,
  HiveInterface,
  ImagePicker,
  File
])
void main() {}
