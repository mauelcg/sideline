import 'package:authentication/ui/profile/sheets/skills_view.form.dart';
import 'package:authentication/ui/profile/sheets/skills_viewmodel.dart';
import 'package:authentication/ui/shared/styles.dart';
import 'package:authentication/ui/shared/ui_helpers.dart';
import 'package:authentication/ui/widgets/box_input_field.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@FormView(fields: [FormTextField(name: 'summary')])
class SkillsView extends StatelessWidget with $SkillsView {
  final SheetRequest request;
  final Function(SheetResponse) completer;
  SkillsView({Key? key, required this.request, required this.completer}) : super(key: key);

  Widget _buildHeader() => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.close_rounded),
          horizontalSpaceRegular,
          Expanded(flex: 1, child: Text(request.title!, style: subheadingStyle)),
          TextButton(onPressed: () => {}, child: const Text("Save", style: TextStyle(color: Colors.black)))
        ],
      );

  Widget _buildForm(SkillsViewModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Help employers find you by showcasing all of your skills.', style: bodyStyle.copyWith(color: kcMediumGreyColor)),
          verticalSpaceMedium,
          FocusScope(
            child: Focus(
              onFocusChange: model.onFocusChanged,
              child: BoxInputField(
                controller: summaryController,
                minLines: 1,
                maxLines: 1,
                labelText: 'Skill',
                placeholder: 'Enter skill',
                filled: false,
                enabledBorderColor: kcLightGreyColor,
                focusedBorderColor: kcPrimaryColor,
                errorBorderColor: Colors.red,
                borderColor: kcLightGreyColor,
              ),
            ),
          ),
          verticalSpaceLarge,
          Text('Added skills', style: bodyStyle.copyWith(fontWeight: FontWeight.w600)),
          verticalSpaceSmall,
          Wrap(
            children: [
              Container(child: OutlinedButton(onPressed: () => null, child: const Text('Java')), margin: const EdgeInsets.only(right: 10)),
              Container(child: OutlinedButton(onPressed: () => null, child: const Text('Flutter')), margin: const EdgeInsets.only(right: 10)),
              Container(child: OutlinedButton(onPressed: () => null, child: const Text('HTML')), margin: const EdgeInsets.only(right: 10)),
              Container(child: OutlinedButton(onPressed: () => null, child: const Text('CSS')), margin: const EdgeInsets.only(right: 10)),
              Container(child: OutlinedButton(onPressed: () => null, child: const Text('JavaScript')), margin: const EdgeInsets.only(right: 10)),
              Container(child: OutlinedButton(onPressed: () => null, child: const Text('C/C++')), margin: const EdgeInsets.only(right: 10)),
            ],
          ),
        ],
      );

  Widget _buildFooter(SkillsViewModel model) => Text(
        'END',
        style: captionStyle.copyWith(color: kcMediumGreyColor),
      );

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SkillsViewModel>.reactive(
      viewModelBuilder: () => SkillsViewModel(),
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
