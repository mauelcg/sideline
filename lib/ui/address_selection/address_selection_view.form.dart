import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

const String AddressValueKey = 'address';

mixin $AddressSelectionView on StatelessWidget {
  final TextEditingController addressController = TextEditingController();
  final FocusNode addressFocusNode = FocusNode();

  // Registers a listener on every generated controller that calls [model.setData()] with the latest textController class
  void listenToFormUpdated(FormViewModel model) {
    addressController.addListener(() => _updateFormData(model));
  }

  // Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(model.formValueMap..addAll({AddressValueKey: addressController.text}));

  // Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null
    addressController.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get addressValue => formValueMap[AddressValueKey];
  bool get hasAddress => formValueMap.containsKey(AddressValueKey);
}

extension Methods on FormViewModel {}
