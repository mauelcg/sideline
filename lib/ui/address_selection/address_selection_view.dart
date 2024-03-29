import 'package:authentication/ui/address_selection/address_selection_view.form.dart';
import 'package:authentication/ui/shared/styles.dart';
import 'package:authentication/ui/shared/ui_helpers.dart';
import 'package:authentication/ui/widgets/autocomplete_listItem.dart';
import 'package:authentication/ui/widgets/box_button.dart';
import 'package:authentication/ui/widgets/box_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import '../widgets/box_input_field.dart';
import 'address_selection_viewmodel.dart';

@FormView(fields: [FormTextField(name: 'address')])
class AddressSelectionView extends StatelessWidget with $AddressSelectionView {
  AddressSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddressSelectionViewModel>.reactive(
      onViewModelReady: listenToFormUpdated,
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: kcPrimaryColor,
        ),
        bottomNavigationBar: Visibility(
          // visible: model.hasSelectedPlace,
          visible: true,
          child: Container(
            margin: EdgeInsets.all(20.0),
            child: BoxButton(
              title: 'Continue',
              busy: model.isBusy,
              // disabled: !model.hasSelectedPlace,
              disabled: false,
              onTap: () => model.selectAddressSuggestion(),
            ),
          ),
        ),

        body: ListView(
          padding: EdgeInsets.all(20.0),
          children: [
            Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BoxText.headingTwo('Find restaurants near you'),
                  verticalSpaceSmall,
                  BoxText.body(
                    "Please enter your location or allow access to your location to find restaurants near you",
                    align: TextAlign.center,
                  )
                ],
              ),
            ),
            FocusScope(
              child: Focus(
                onFocusChange: model.onFocusChanged,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  margin: model.focus ? EdgeInsets.only(top: 30.0) : EdgeInsets.only(top: 50.0),
                  child: BoxInputField(
                    controller: addressController,
                    leading: Icon(
                      Icons.location_on,
                      color: kcMediumGreyColor,
                    ),
                    trailing: Icon(
                      Icons.close,
                      color: kcMediumGreyColor,
                    ),
                    trailingTapped: () => addressController.clear(),
                    placeholder: "Enter a new address",
                  ),
                ),
              ),
            ),
            verticalSpaceMedium,
            if (!model.hasAutoCompleteResults && model.hasAddress && model.addressValue!.isEmpty) BoxText.body('We have no suggestions for you'),
            if (model.hasAutoCompleteResults && !model.isBusy)
              ...model.autoCompleteResults.map(
                (autoCompleteResult) => AutoCompleteListItem(
                  state: autoCompleteResult.secondaryText ?? '',
                  city: autoCompleteResult.mainText ?? '',
                  onTap: () {
                    SystemChannels.textInput.invokeMethod('TextInput.hide');
                    model.setSelectedSuggestion(autoCompleteResult);
                    addressController.text = "${autoCompleteResult.mainText}";
                  },
                ),
              )
          ],
        ),

        // Makes the button center
      ),
      viewModelBuilder: () => AddressSelectionViewModel(),
    );
  }
}
