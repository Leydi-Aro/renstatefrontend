import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';

class Utils {
  static Future<ByteData?> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    final codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: width,
    );
    final frameInfo = await codec.getNextFrame();
    return (await frameInfo.image.toByteData(format: ui.ImageByteFormat.png));
  }
}