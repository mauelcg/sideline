import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String SummaryValueKey = 'summary';

mixin $EducationView on StatelessWidget {
  final TextEditingController summaryController = TextEditingController();
  final FocusNode summaryFocusNode = FocusNode();

  // Registers a listener on every generated controller that calls [model.setData()] with the latest textController class
  void listenToFormUpdated(FormViewModel model) {
    summaryController.addListener(() => _updateFormData(model));
  }

  // Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model) => model.setData(model.formValueMap..addAll({SummaryValueKey: summaryController.text}));

  // Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null
    summaryController.dispose();
  }
}

extension ValueProperties on FormViewModel {
  String? get summaryValue => formValueMap[SummaryValueKey];
  bool get hasSummary => formValueMap.containsKey(SummaryValueKey);
}

extension Methods on FormViewModel {}
