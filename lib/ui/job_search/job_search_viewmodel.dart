import 'package:authentication/app/app.locator.dart';
import 'package:authentication/ui/job_search/job_search_view.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.logger.dart';
import '../../app/app.router.dart';

class JobSearchViewModel extends FormViewModel {
  final logger = getLogger('JobSearchViewModel');

  final _navigationService = locator<NavigationService>();

  List<String> _autoCompleteResults = [];
  String? _selectedKeywords;
  String? _selectedLocation;
  String? _selectedCategory;

  bool get hasSelectedKeywords => _selectedKeywords != null;
  bool get hasSelectedLocation => _selectedLocation != null;
  bool get hasSelectedCategory => _selectedCategory != null;

  List<String> get autoCompleteResults => _autoCompleteResults;

  bool get hasAutoCompleteResults => _autoCompleteResults.isNotEmpty;

  // Indicates whether the [BoxInputField] is focused or not
  // We can use this property for animation to move the "search input" higher when the user focuses on it
  bool focus = false;

  @override
  void setFormStatus() {
    _getAutoCompleteResults();
  }

  Future<void> _getAutoCompleteResults() async {
    if (keywordsValue != null) {
      final keywordsResults = await Future.delayed(const Duration(seconds: 3), () => List<String>.empty());

      if (keywordsResults != null) {
        _autoCompleteResults = keywordsResults;
        notifyListeners();
      }
    }
  }

  // Gets the details from the Places Api and saves it to the backend
  Future<void> selectParametersSuggestion({
    String? autoCompleteResult,
  }) async {
    var parameters = <String, String>{};

    parameters.addAll({KeywordsValueKey: keywordsValue!, LocationValueKey: locationValue!, CategoryValueKey: categoryValue!});

    _navigationService.navigateTo(Routes.jobResultsView, arguments: JobResultsViewArguments(searchParameters: parameters));
    return;
  }

  void setSelectedKeywordsSuggestion(String autoCompleteResult) {
    logger.i('autoCompleteResult:$autoCompleteResult');
    _selectedKeywords = autoCompleteResult;

    _autoCompleteResults.clear();

    notifyListeners();
  }

  void setSelectedLocationSuggestion(String autoCompleteResult) {
    logger.i('autoCompleteResult:$autoCompleteResult');
    _selectedLocation = autoCompleteResult;

    _autoCompleteResults.clear();

    notifyListeners();
  }

  void setSelectedCategorySuggestion(String autoCompleteResult) {
    logger.i('autoCompleteResult:$autoCompleteResult');
    _selectedCategory = autoCompleteResult;

    _autoCompleteResults.clear();

    notifyListeners();
  }

  // Updates the [BoxInputField] focus state
  void onFocusChanged(bool isFocus) {
    focus = isFocus;
    notifyListeners();
  }
}
