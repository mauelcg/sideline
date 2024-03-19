import 'package:authentication/api/firestore_api.dart';
import 'package:authentication/app/app.logger.dart';
import 'package:authentication/constants/app_strings.dart';
import 'package:authentication/services/user_service.dart';
import 'package:authentication/ui/address_selection/address_selection_view.form.dart';
import 'package:places_service/places_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../app/app.router.dart';
import '../../models/application_models.dart';

class AddressSelectionViewModel extends FormViewModel {
  final logger = getLogger('AddressSelectionViewModel');

  final _placesService = locator<PlacesService>();
  final _dialogService = locator<DialogService>();
  final _firestoreApi = locator<FirestoreApi>();
  final _navigationService = locator<NavigationService>();
  final _userService = locator<UserService>();

  List<PlacesAutoCompleteResult> _autoCompleteResults = [];
  PlacesAutoCompleteResult? _selectedResult;

  bool get hasSelectedPlace => _selectedResult != null;

  List<PlacesAutoCompleteResult> get autoCompleteResults => _autoCompleteResults;

  bool get hasAutoCompleteResults => _autoCompleteResults.isNotEmpty;

  // Indicates whether the [BoxInputField] is focused or not
  // We can use this property for animation to move the "search input" higher when the user focuses on it
  bool focus = false;

  @override
  void setFormStatus() {
    _getAutoCompleteResults();
  }

  Future<void> _getAutoCompleteResults() async {
    if (addressValue != null) {
      final placesResults = await _placesService.getAutoComplete(addressValue!);

      if (placesResults != null) {
        _autoCompleteResults = placesResults;
        notifyListeners();
      }
    }
  }

  // Gets the details from the Places Api and saves it to the backend
  Future<void> selectAddressSuggestion({
    PlacesAutoCompleteResult? autoCompleteResult,
  }) async {
    PlacesAutoCompleteResult selectedResult = autoCompleteResult ?? _selectedResult!;

    logger.i('Selected $selectedResult as the suggestion');

    if (selectedResult.placeId == null) {
      _dialogService.showDialog(title: InvalidAutoCompleteDialogTitle, description: InvalidAutoCompleteDialogDescription);
    } else {
      setBusy(true);

      final placeDetails = await _placesService.getPlaceDetails(selectedResult.placeId ?? '');
      logger.v('Place Details: $placeDetails');

      final city = placeDetails.city ?? '';
      final cityServiced = await _firestoreApi.isCityServiced(city: city);

      if (!cityServiced) {
        await _dialogService.showDialog(title: CityNotServiceDialogTitle, description: CityNotServicedDialogDescription);
      } else {
        final address = Address(
          placeId: placeDetails.placeId!,
          lattitude: placeDetails.lat ?? -1,
          longitude: placeDetails.lng ?? -1,
          city: placeDetails.city,
          postalCode: placeDetails.zip,
          state: placeDetails.state,
          street: placeDetails.streetLong ?? placeDetails.streetShort,
        );

        final saveSuccess = await _firestoreApi.saveAddress(address: address, user: _userService.currentUser);

        if (!saveSuccess) {
          logger.v('Address save failed. Notify user to try again');
          _dialogService.showDialog(title: AddressSaveFailedDialogTitle, description: AddressSaveFailedDialogDescription);
        } else {
          logger.v('Address has been saved! We\'re ready to show them some products!');
          _navigationService.clearStackAndShow(Routes.homeView);
        }
      }

      setBusy(false);
    }
  }

  void setSelectedSuggestion(PlacesAutoCompleteResult autoCompleteResult) {
    logger.i('autoCompleteResult:$autoCompleteResult');
    _selectedResult = autoCompleteResult;

    _autoCompleteResults.clear();

    notifyListeners();
  }

  // Updates the [BoxInputField] focus state
  void onFocusChanged(bool isFocus) {
    this.focus = isFocus;
    notifyListeners();
  }
}
