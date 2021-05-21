import 'package:battlecats/locator.dart';
import 'package:battlecats/models/cat.dart';
import 'package:battlecats/services/dialog_service.dart';
import 'package:battlecats/services/firestore_service.dart';
import 'package:battlecats/services/navigation_service.dart';
import 'package:battlecats/viewmodels/base_model.dart';

class BattleHomeViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final FirestoreService _firestoreService = locator<FirestoreService>();
  final DialogService _dialogService = locator<DialogService>();

  BattleHomeViewModel(this._cats);

  final List<Cat> _cats;
  List<Cat> get cats => _cats;

  Cat _active;
  Cat get active => _active;
  String _activeName;
  String get activeName => _activeName;

  void setActiveCat(Cat c) {
    _active = c;
    notifyListeners();
  }

/*
  Future deleteInventoryItem(int index, String userId) async {
    var dialogResponse = await _dialogService.showConfirmationDialog(
      title: 'Are you sure?',
      description: 'Do you really want to delete this gear item?',
      confirmationTitle: 'Yes',
      cancelTitle: 'No',
    );

    if (dialogResponse.confirmed) {
      setBusy(true);
      await _firestoreService.deleteCat(
          itemId: _inventory[index].documentId, userId: userId);
      setBusy(false);
    }
  }

  // inventory navigation
  Future navigateToInventoryCreateView() async {
    await _navigationService.navigateTo(CreateInventoryViewRoute);
  }

  Future navigateToInventoryDetailsView(GearItem item) async {
    await _navigationService.navigateTo(InventoryDetailsViewRoute,
        arguments: item);
  }
  */
}
