import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String KeywordsValueKey = 'keywords';
const String LocationValueKey = 'location';
const String CategoryValueKey = 'category';

mixin $JobSearchView on StatelessWidget {
  final TextEditingController keywordsController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController categoryController = TextEditingController();
  final keywordsFocusNode = FocusNode();
  final locationFocusNode = FocusNode();
  final categoryFocusNode = FocusNode();

  // Registers a listener on every generated controller that calls [model.setData()] with the latest textController class
  void listenToFormUpdated(FormViewModel model) {
    keywordsController.addListener(() => _updateFormData(model));
    locationController.addListener(() => _updateFormData(model));
    categoryController.addListener(() => _updateFormData(model));
  }

  // Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(model.formValueMap
    ..addAll({
      KeywordsValueKey: keywordsController.text,
      LocationValueKey: locationController.text,
      CategoryValueKey: categoryController.text,
    }));

  // Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null
    keywordsController.dispose();
    locationController.dispose();
    categoryController.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get keywordsValue => formValueMap[KeywordsValueKey];
  String? get locationValue => formValueMap[LocationValueKey];
  String? get categoryValue => formValueMap[CategoryValueKey];

  bool get hasKeywords => formValueMap.containsKey(KeywordsValueKey);
  bool get hasLocation => formValueMap.containsKey(LocationValueKey);
  bool get hasCategory => formValueMap.containsKey(CategoryValueKey);
}

extension Methods on FormViewModel {}
