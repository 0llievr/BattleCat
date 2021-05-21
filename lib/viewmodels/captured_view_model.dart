import 'dart:io';
import 'package:battlecats/locator.dart';
import 'package:battlecats/models/cat.dart';
import 'package:battlecats/services/firestore_service.dart';
import 'package:battlecats/services/navigation_service.dart';
import 'package:battlecats/ui/views/captured_view.dart';
import 'package:battlecats/viewmodels/base_model.dart';
import 'package:image_picker/image_picker.dart';

class CapturedViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();

  // ERROR HANDLING
  dynamic imageFile;

  Future addCat({
    String name,
    String imageUrl,
    String attack,
    String hp,
    String userId,
  }) async {
    /*
    var imageUrl;
    if (imageFile != null) {
      imageUrl = await _firestoreService.addImage(imageFile);
    }
    */
    setBusy(true);
    await _firestoreService.addCat(
      Cat(
        name: name,
        imageUrl: imageUrl,
        trainerId: userId,
      ),
    );
    setBusy(false);
    _navigationService.pop();
  }

  dynamic _getImage() async {
    try {
      var imagePath = await ImagePicker()
          .getImage(source: ImageSource.camera)
          .then((pickedFile) => pickedFile.path);
      return File(imagePath);
    } catch (e) {
      return e;
    }
  }

  void addImage() async {
    imageFile = await _getImage();
    _firestoreService.addImage(imageFile);
  }

  void back() {
    _navigationService.pop();
  }
}
