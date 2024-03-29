import 'package:authentication/app/app.logger.dart';
import 'package:authentication/ui/profile/sheets/personal_summary_view.form.dart';
import 'package:stacked/stacked.dart';

class EducationViewModel extends FormViewModel {
  var logger = getLogger('FloatingBoxBottomSheetViewModel');

  int _summaryLength = 0;
  int get summaryLength => _summaryLength;

  bool focus = false;

  @override
  void setFormStatus() {
    _getSummaryLength();
  }

  void _getSummaryLength() {
    if (summaryValue != null) {
      _summaryLength = summaryValue!.length;
      notifyListeners();
    }
  }

  void onFocusChanged(bool isFocus) {
    focus = isFocus;
    notifyListeners();
  }
}
