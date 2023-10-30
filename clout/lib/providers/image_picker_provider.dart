import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
