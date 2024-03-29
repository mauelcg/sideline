import 'package:authentication/ui/profile/sheets/career_history_view.dart';
import 'package:authentication/ui/profile/sheets/education_view.dart';
import 'package:authentication/ui/profile/sheets/languages_view.dart';
import 'package:authentication/ui/profile/sheets/licenses_view.dart';
import 'package:authentication/ui/profile/sheets/personal_summary_view.dart';
import 'package:authentication/ui/profile/sheets/skills_view.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:authentication/constants/app_bottom_sheet_type.dart';

import 'app.locator.dart';

void setupBottomSheetUi() {
  final bottomSheetService = locator<BottomSheetService>();

  final builders = {
    // Profile Sheets
    AppBottomSheetType.personalSummary: (context, sheetRequest, completer) => PersonalSummaryView(request: sheetRequest, completer: completer),
    AppBottomSheetType.careerHistory: (context, sheetRequest, completer) => CareerHistoryView(request: sheetRequest, completer: completer),
    AppBottomSheetType.education: (context, sheetRequest, completer) => EducationView(request: sheetRequest, completer: completer),
    AppBottomSheetType.languages: (context, sheetRequest, completer) => LanguagesView(request: sheetRequest, completer: completer),
    AppBottomSheetType.licenses: (context, sheetRequest, completer) => LicensesView(request: sheetRequest, completer: completer),
    AppBottomSheetType.skills: (context, sheetRequest, completer) => SkillsView(request: sheetRequest, completer: completer),
    // End
  };

  bottomSheetService.setCustomSheetBuilders(builders);
}
