import 'package:authentication/ui/profile/sheets/licenses_view.form.dart';
import 'package:authentication/ui/profile/sheets/licenses_viewmodel.dart';
import 'package:authentication/ui/shared/styles.dart';
import 'package:authentication/ui/shared/ui_helpers.dart';
import 'package:authentication/ui/widgets/box_input_field.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@FormView(fields: [FormTextField(name: 'summary')])
class LicensesView extends StatelessWidget with $LicensesView {
  final SheetRequest request;
  final Function(SheetResponse) completer;
  LicensesView({Key? key, required this.request, required this.completer}) : super(key: key);

  Widget _buildHeader() => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.close_rounded),
          horizontalSpaceRegular,
          Expanded(flex: 1, child: Text(request.title!, style: subheadingStyle)),
          TextButton(onPressed: () => {}, child: const Text("Save", style: TextStyle(color: Colors.black)))
        ],
      );

  Widget _buildForm(LicensesViewModel model) => Column(
        children: [
          Text('Showcase your licenses, certificates, memberships and accreditations.', style: bodyStyle.copyWith(color: kcMediumGreyColor)),
          verticalSpaceMedium,
          FocusScope(
            child: Focus(
              onFocusChange: model.onFocusChanged,
              child: BoxInputField(
                controller: summaryController,
                minLines: 1,
                maxLines: 1,
                labelText: 'License name',
                placeholder: 'Enter license name',
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
                labelText: 'Issuing organisation (optional)',
                placeholder: 'Enter organisation',
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
                labelText: 'Issue date (optional)',
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
              const Text("No expiry", style: bodyStyle),
              Switch(
                value: false,
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
                labelText: 'Expiry data (recommended)',
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
                labelText: 'Description (recommended)',
                placeholder: 'Briefly describe this credential - you can also add a type or URL if applicable.',
                enabledBorderColor: kcLightGreyColor,
                focusedBorderColor: kcPrimaryColor,
                errorBorderColor: Colors.red,
                borderColor: kcLightGreyColor,
              ),
            ),
          ),
        ],
      );

  Widget _buildFooter(LicensesViewModel model) => Text('END', style: captionStyle.copyWith(color: kcMediumGreyColor));

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LicensesViewModel>.reactive(
      viewModelBuilder: () => LicensesViewModel(),
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
