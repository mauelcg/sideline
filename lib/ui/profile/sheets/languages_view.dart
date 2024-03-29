import 'package:authentication/ui/profile/sheets/languages_view.form.dart';
import 'package:authentication/ui/profile/sheets/languages_viewmodel.dart';
import 'package:authentication/ui/shared/styles.dart';
import 'package:authentication/ui/shared/ui_helpers.dart';
import 'package:authentication/ui/widgets/box_input_field.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@FormView(fields: [FormTextField(name: 'summary')])
class LanguagesView extends StatelessWidget with $LanguagesView {
  final SheetRequest request;
  final Function(SheetResponse) completer;
  LanguagesView({Key? key, required this.request, required this.completer}) : super(key: key);

  Widget _buildHeader() => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.close_rounded),
          horizontalSpaceRegular,
          Expanded(flex: 1, child: Text(request.title!, style: subheadingStyle)),
          TextButton(onPressed: () => {}, child: const Text("Save", style: TextStyle(color: Colors.black)))
        ],
      );

  Widget _buildForm(LanguagesViewModel model) => FocusScope(
        child: Focus(
          onFocusChange: model.onFocusChanged,
          child: BoxInputField(
            controller: summaryController,
            minLines: 1,
            maxLines: 1,
            labelText: 'Language',
            placeholder: 'Enter language',
            filled: false,
            enabledBorderColor: kcLightGreyColor,
            focusedBorderColor: kcPrimaryColor,
            errorBorderColor: Colors.red,
            borderColor: kcLightGreyColor,
          ),
        ),
      );

  Widget _buildFooter(LanguagesViewModel model) => Text('END', style: captionStyle.copyWith(color: kcMediumGreyColor));

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LanguagesViewModel>.reactive(
      viewModelBuilder: () => LanguagesViewModel(),
      onViewModelReady: listenToFormUpdated,
      builder: (context, model, child) => Container(
        margin: const EdgeInsets.only(top: 100),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)), color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[_buildHeader(), verticalSpaceMedium, _buildForm(model), verticalSpaceMedium, _buildFooter(model)],
        ),
      ),
    );
  }
}
