import 'package:authentication/ui/profile/sheets/career_history_view.form.dart';
import 'package:authentication/ui/profile/sheets/career_history_viewmodel.dart';
import 'package:authentication/ui/shared/styles.dart';
import 'package:authentication/ui/shared/ui_helpers.dart';
import 'package:authentication/ui/widgets/box_input_field.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@FormView(fields: [FormTextField(name: 'summary')])
class CareerHistoryView extends StatelessWidget with $CareerHistoryView {
  final SheetRequest request;
  final Function(SheetResponse) completer;
  CareerHistoryView({Key? key, required this.request, required this.completer}) : super(key: key);

  Widget _buildHeader() => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.close_rounded),
          horizontalSpaceRegular,
          Expanded(flex: 1, child: Text(request.title!, style: subheadingStyle)),
          TextButton(onPressed: () => {}, child: const Text("Save", style: TextStyle(color: Colors.black)))
        ],
      );

  Widget _buildForm(CareerHistoryViewModel model) => Column(
        children: [
          FocusScope(
            child: Focus(
              onFocusChange: model.onFocusChanged,
              child: BoxInputField(
                controller: summaryController,
                minLines: 1,
                maxLines: 1,
                labelText: 'Job title',
                placeholder: 'Enter job title',
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
                labelText: 'Company name',
                placeholder: 'Enter company name',
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
                labelText: 'Start date',
                placeholder: 'Enter month/year',
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
              const Text("I'm still in this role", style: bodyStyle),
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
                minLines: 3,
                maxLines: 3,
                filled: false,
                labelText: 'Description (recommended)',
                placeholder: 'Summarise your responsibilities, skills and achievements.',
                enabledBorderColor: kcLightGreyColor,
                focusedBorderColor: kcPrimaryColor,
                errorBorderColor: Colors.red,
                borderColor: kcLightGreyColor,
              ),
            ),
          ),
        ],
      );

  Widget _buildFooter(CareerHistoryViewModel model) => Text(
        'END',
        style: captionStyle.copyWith(color: kcMediumGreyColor),
      );

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CareerHistoryViewModel>.reactive(
      viewModelBuilder: () => CareerHistoryViewModel(),
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
