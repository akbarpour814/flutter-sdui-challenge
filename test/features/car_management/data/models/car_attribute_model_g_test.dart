import 'dart:typed_data';
import 'package:flutter_sdui_challenge/features/car_management/data/models/car_attribute_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/src/binary/binary_writer_impl.dart'; // Import BinaryWriterImpl
import 'package:hive/src/binary/binary_reader_impl.dart'; // Import BinaryReaderImpl
import 'package:hive/src/registry/type_registry_impl.dart'; // Import TypeRegistryImpl

void main() {
  group('CarAttributeModelAdapter Tests', () {
    final adapter = CarAttributeModelAdapter();
    final typeRegistry = TypeRegistryImpl();

    test('Adapter should have correct typeId', () {
      expect(adapter.typeId, 0);
    });

    test('Adapter should correctly read and write CarAttributeModel', () {
      // Create a test instance of CarAttributeModel
      final carAttributeModel = CarAttributeModel(
        attrName: 'Color',
        attrLabel: 'Vehicle Color',
        attrValue: 'Red',
        fileBytes: [Uint8List.fromList([0, 1, 2, 3])],
      );

      // Create a binary writer for testing
      final binaryWriter = BinaryWriterImpl(typeRegistry);
      adapter.write(binaryWriter, carAttributeModel);
      final bytes = binaryWriter.toBytes();

      // Create a binary reader for testing
      final binaryReader = BinaryReaderImpl(bytes,typeRegistry);
      final result = adapter.read(binaryReader);

      // Validate that the object read is the same as the original
      expect(result.attrName, carAttributeModel.attrName);
      expect(result.attrLabel, carAttributeModel.attrLabel);
      expect(result.attrValue, carAttributeModel.attrValue);
      expect(result.fileBytes, carAttributeModel.fileBytes);
    });
  });
}