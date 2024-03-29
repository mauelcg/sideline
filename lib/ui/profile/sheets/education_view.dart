import 'package:authentication/ui/profile/sheets/education_viewmodel.dart';
import 'package:authentication/ui/shared/styles.dart';
import 'package:authentication/ui/shared/ui_helpers.dart';
import 'package:authentication/ui/widgets/box_input_field.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import 'education_view.form.dart';

@FormView(fields: [FormTextField(name: 'summary')])
class EducationView extends StatelessWidget with $EducationView {
  final SheetRequest request;
  final Function(SheetResponse) completer;
  EducationView({Key? key, required this.request, required this.completer}) : super(key: key);

  Widget _buildHeader() => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.close_rounded),
          horizontalSpaceRegular,
          Expanded(flex: 1, child: Text(request.title!, style: subheadingStyle)),
          TextButton(onPressed: () => {}, child: const Text("Save", style: TextStyle(color: Colors.black)))
        ],
      );

  Widget _buildForm(EducationViewModel model) => Column(
        children: [
          FocusScope(
            child: Focus(
              onFocusChange: model.onFocusChanged,
              child: BoxInputField(
                controller: summaryController,
                minLines: 1,
                maxLines: 1,
                labelText: 'Course or qualification',
                placeholder: 'Enter course or qualification',
                filled: false,
                enabledBorderColor: kcLightGreyColor,
                focusedBorderColor: kcPrimaryColor,
                errorBorderColor: Colors.red,
                borderColor: kcLightGreyColor,
              ),
            ),
          ),
          verticalSpaceLarge,
          FocusScope(
            child: Focus(
              onFocusChange: model.onFocusChanged,
              child: BoxInputField(
                controller: summaryController,
                minLines: 1,
                maxLines: 1,
                filled: false,
                labelText: 'Institution',
                placeholder: 'Enter institution',
                enabledBorderColor: kcLightGreyColor,
                focusedBorderColor: kcPrimaryColor,
                errorBorderColor: Colors.red,
                borderColor: kcLightGreyColor,
              ),
            ),
          ),
          verticalSpaceMedium,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("Qualification complete", style: bodyStyle),
              Switch(
                value: true,
                onChanged: (value) {},
                activeColor: kcPrimaryColor,
              )
            ],
          ),
          verticalSpaceMedium,
          FocusScope(
            child: Focus(
              onFocusChange: model.onFocusChanged,
              child: BoxInputField(
                controller: summaryController,
                minLines: 1,
                maxLines: 1,
                filled: false,
                labelText: 'Finished (optional)',
                placeholder: 'Enter month/year',
                enabledBorderColor: kcLightGreyColor,
                focusedBorderColor: kcPrimaryColor,
                errorBorderColor: Colors.red,
                borderColor: kcLightGreyColor,
              ),
            ),
          ),
          verticalSpaceLarge,
          FocusScope(
            child: Focus(
              onFocusChange: model.onFocusChanged,
              child: BoxInputField(
                controller: summaryController,
                minLines: 3,
                maxLines: 3,
                filled: false,
                labelText: 'Course highlights (optional)',
                placeholder: 'Add activities, projects, awards or achievements during your study.',
                enabledBorderColor: kcLightGreyColor,
                focusedBorderColor: kcPrimaryColor,
                errorBorderColor: Colors.red,
                borderColor: kcLightGreyColor,
              ),
            ),
          ),
        ],
      );

  Widget _buildFooter(EducationViewModel model) => Text(
        'END',
        style: captionStyle.copyWith(color: kcMediumGreyColor),
      );

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<EducationViewModel>.reactive(
      viewModelBuilder: () => EducationViewModel(),
      onViewModelReady: listenToFormUpdated,
      builder: (context, model, child) => Container(
        margin: const EdgeInsets.only(top: 100),
        height: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)), color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[_buildHeader(), verticalSpaceMedium, _buildForm(model), verticalSpaceMedium, _buildFooter(model)],
          ),
        ),
      ),
    );
  }
}
