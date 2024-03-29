import 'package:authentication/ui/profile/sheets/personal_summary_view.form.dart';
import 'package:authentication/ui/profile/sheets/personal_summary_viewmodel.dart';
import 'package:authentication/ui/shared/styles.dart';
import 'package:authentication/ui/shared/ui_helpers.dart';
import 'package:authentication/ui/widgets/box_input_field.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@FormView(fields: [FormTextField(name: 'summary')])
class PersonalSummaryView extends StatelessWidget with $PersonalSummaryView {
  final SheetRequest request;
  final Function(SheetResponse) completer;
  PersonalSummaryView({Key? key, required this.request, required this.completer}) : super(key: key);

  Widget _buildHeader() => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(Icons.close_rounded),
          horizontalSpaceRegular,
          Expanded(flex: 1, child: Text(request.title!, style: subheadingStyle)),
          TextButton(onPressed: () => {}, child: const Text("Save", style: TextStyle(color: Colors.black)))
        ],
      );

  Widget _buildForm(PersonalSummaryViewModel model) => Expanded(
        flex: 1,
        child: FocusScope(
            child: Focus(
          onFocusChange: model.onFocusChanged,
          child: BoxInputField(
            controller: summaryController,
            expands: true,
            filled: false,
            maxLength: 700,
            minLines: null,
            maxLines: null,
            constraints: const BoxConstraints(minHeight: double.infinity),
            enabledBorderColor: Colors.transparent,
            focusedBorderColor: Colors.transparent,
            errorBorderColor: Colors.transparent,
            borderColor: Colors.transparent,
          ),
        )),
      );

  Widget _buildFooter(PersonalSummaryViewModel model) => Text('${model.summaryLength}/700');

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PersonalSummaryViewModel>.reactive(
      viewModelBuilder: () => PersonalSummaryViewModel(),
      onViewModelReady: listenToFormUpdated,
      builder: (context, model, child) => Container(
        margin: const EdgeInsets.only(top: 100),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: const BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(8), topRight: Radius.circular(8)), color: Colors.white),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[_buildHeader(), _buildForm(model), _buildFooter(model)],
        ),
      ),
    );
  }
}
