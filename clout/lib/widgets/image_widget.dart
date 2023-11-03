import 'dart:io';
import 'dart:typed_data';
import 'package:clout/providers/image_picker_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:clout/style.dart' as style;
import 'dart:ui' as ui;

class ImageWidget extends ConsumerStatefulWidget {
  const ImageWidget({super.key, this.parentImages});
  final parentImages;

  @override
  ImageWidgetState createState() => ImageWidgetState();
}

class ImageWidgetState extends ConsumerState<ImageWidget> {
  @override
  Widget build(BuildContext context) {
    final images = ref.watch(imagePickerProvider);
    load() {
      ref.read(imagePickerProvider.notifier).loadPreviousImage();
    }

    load();
    double imgBoxSize = MediaQuery.of(context).size.width * 0.2;
    Widget imageBox(XFile img) => GestureDetector(
        onTap: () => {
              ref.read(imagePickerProvider.notifier).delImage(img),
              // print(images)
            },
        child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 2),
            width: imgBoxSize,
            height: imgBoxSize,
            child: Stack(children: [
              Center(
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 1, color: style.colors['main1']!),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image.file(File(img.path)).image),
                          borderRadius: BorderRadius.circular(10)),
                      width: imgBoxSize,
                      height: imgBoxSize)),
              // 사진 삭제하는 버튼(오른쪽 위 X버튼)
              Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)),
                      child:
                          Icon(Icons.close, size: 15, color: Colors.grey[400])))
            ])));

    return Row(children: [
      if (images.length == 4) ...[
        ...images.map((e) => imageBox(e)).toList(),
      ] else ...[
        ...images.map((e) => imageBox(e)).toList(),
        InkWell(
            onTap: () => ref.read(imagePickerProvider.notifier).getImage(),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 1),
              width: MediaQuery.of(context).size.width * 0.2,
              height: MediaQuery.of(context).size.width * 0.2,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!, width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.image, color: Colors.grey[400]!),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    'image',
                    style: TextStyle(
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0),
                  )
                ],
              ),
            ))
      ]
    ]);
  }
}
