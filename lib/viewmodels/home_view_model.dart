import 'dart:io';

import 'package:flutter/material.dart';
import 'package:battlecats/constants/route_names.dart';
import 'package:battlecats/locator.dart';
import 'package:battlecats/models/cat.dart';
import 'package:battlecats/models/battle.dart';
import 'package:battlecats/services/dialog_service.dart';
import 'package:battlecats/services/firestore_service.dart';
import 'package:battlecats/services/navigation_service.dart';
import 'package:battlecats/ui/views/battle_view.dart';
import 'package:battlecats/ui/views/cats_home_view.dart';
import 'package:battlecats/viewmodels/base_model.dart';
import 'package:image_picker/image_picker.dart';

class HomeViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final DialogService _dialogService = locator<DialogService>();

  List<Battle> _battles;
  List<Battle> get battles => _battles;

  List<Cat> _cats;
  List<Cat> get cats => _cats;

  var _imageFile;

  int _navBarState = 0;
  int get navBarState => _navBarState;

  dynamic _getImage() async {
    var imagePath = await ImagePicker()
        .getImage(source: ImageSource.camera)
        .then((pickedFile) => pickedFile.path);
    return File(imagePath);
  }

  Widget selectedPage(HomeViewModel model) {
    List _barOptions = [
      BattleHomeView(cats: _cats),
      Text(''),
      CatsHomeView(cats: _cats),
    ];
    return _barOptions.elementAt(_navBarState);
  }

  void setAppbarState(int index) async {
    if (index == 1) {
      _imageFile = await _getImage();
      if (_imageFile != null) {
        navigateToCaptureView(_imageFile);
      }
    } else {
      _navBarState = index;
      notifyListeners();
    }
  }

  void listenToCats(String uid) {
    setBusy(true);

    _firestoreService.listenToCatsRealTime(uid).listen((catsData) {
      List<Cat> updatedCats = catsData;
      if (updatedCats != null && updatedCats.length > 0) {
        _cats = updatedCats;
        notifyListeners();
      }

      setBusy(false);
    });
  }

  Future deleteCat(int index) async {
    var dialogResponse = await _dialogService.showConfirmationDialog(
      title: 'Are you sure?',
      description: 'Do you really want to delete the post?',
      confirmationTitle: 'Yes',
      cancelTitle: 'No',
    );

    if (dialogResponse.confirmed) {
      setBusy(true);
      //await _firestoreService.deleteCat(_cats[index].documentId);
      setBusy(false);
    }
  }

  Future navigateToCaptureView(index) async {
    await _navigationService.navigateTo(CaptureViewRoute,
        arguments: _imageFile);
  }
}
