import 'dart:typed_data';

import 'package:clout/providers/clouter_register_controller.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

final imagePickerProvider =
    StateNotifierProvider<ImageState, List<XFile>>((ref) {
  return ImageState();
});

class ImagePickerService {
  static final ImagePickerService _imagePickerService =
      ImagePickerService._internal();

  factory ImagePickerService() {
    return _imagePickerService;
  }

  ImagePickerService._internal();

  final ImagePicker _picker = ImagePicker();

  Future<List<XFile>> pickImage() async {
    try {
      final pickedFile = await _picker.pickMultiImage();
      return pickedFile;
    } catch (e) {
      print('ImagePickerService: $e');
      return [];
    }
  }

  Future<XFile?> pickSingleImage() async {
    try {
      final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
      return pickedFile;
    } catch (e) {
      print('ImagePickerService: $e');
      return null;
    }
  }
}

//// 여기가 메인 /////////////////////////////////////////
class ImageState extends StateNotifier<List<XFile>> {
  ImageState() : super(<XFile>[]);

  final ImagePickerService picker = ImagePickerService();

  final registerController = Get.find<ClouterRegisterController>();

  @override
  set state(List<XFile> value) {
    super.state = value;
  }

// 기존 사진 가져오는 로직(회원 정보 수정때 사용해야함)
  loadPreviousImage() async {
    if (registerController.images.isNotEmpty) {
      var previousImg = registerController.images;
      List<XFile> imgList = [];
      for (int i = 0; i < previousImg.length; i++) {
        final ByteData bytes = await rootBundle.load(previousImg[i]);
        final Uint8List target = bytes.buffer.asUint8List();
        imgList.add(XFile.fromData(target));
        print('따잇');
      }
      state = imgList;
    }
  }

  delImage(XFile image) {
    var list = [...super.state];
    list.remove(image);
    state = list;
  }

  void addImage(List<XFile> value) {
    var list = [...super.state];
    print('여기? : ${super.state}');

    if (list.isEmpty) {
      state = value;
    } else {
      list.addAll(value);
      list.toSet().toList();
      state = list;
    }
    if (super.state.length > 4) {
      state = super.state.sublist(0, 4);
      Fluttertoast.showToast(msg: '사진은 최대 4장까지만 등록가능합니다.');
    }
  }

  Future getImage() async {
    picker.pickImage().then((value) {
      addImage(value);
    }).catchError((onError) {
      Fluttertoast.showToast(msg: 'failed to get image');
    });
  }
}
