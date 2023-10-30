import 'package:clout/widgets/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

final imagePickerProvider =
    StateNotifierProvider<ImageState, List<XFile>>((ref) {
  return ImageState();
});

class ImageState extends StateNotifier<List<XFile>> {
  ImageState() : super(<XFile>[]);
  final ImagePickerService picker = ImagePickerService();

  @override
  set state(List<XFile> value) {
    super.state = value;
  }

  delImage(XFile image) {
    var list = [...super.state];
    list.remove(image);
    state = list;
  }

  void addImage(List<XFile> value) {
    var list = [...super.state];
    print(super.state);
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
