import 'package:authentication/app/app.locator.dart';
import 'package:authentication/ui/job_search/job_search_view.form.dart';
import 'package:authentication/ui/job_search/job_search_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../shared/styles.dart';
import '../shared/ui_helpers.dart';
import '../widgets/box_button.dart';
import '../widgets/box_input_field.dart';
import '../widgets/box_text.dart';

class JobSearchView extends StatelessWidget with $JobSearchView {
  JobSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<JobSearchViewModel>.reactive(
      viewModelBuilder: () => locator<JobSearchViewModel>(),
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      onViewModelReady: (model) => listenToFormUpdated(model),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          actions: [Icon(Icons.settings_input_component_rounded), horizontalSpaceRegular],
        ),
        bottomNavigationBar: Visibility(
          // visible: model.hasSelectedPlace,
          visible: true,
          child: Container(
            margin: EdgeInsets.all(20.0),
            child: BoxButton(
              title: 'Search',
              busy: model.isBusy,
              // disabled: !model.hasSelectedPlace,
              disabled: false,
              onTap: () => model.selectParametersSuggestion(),
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
                  Text('Search jobs near you', style: heading2Style.copyWith(color: kcPrimaryColor)),
                  verticalSpaceMedium,
                  BoxText.body(
                    "Please enter your location or allow access to your location to find sidelines near you",
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
                  margin: model.focus ? EdgeInsets.only(top: 10.0) : EdgeInsets.only(top: 15.0),
                  child: BoxInputField(
                    controller: keywordsController,
                    leading: Icon(
                      Icons.text_increase_sharp,
                      color: kcPrimaryColor,
                    ),
                    trailing: Icon(
                      Icons.close,
                      color: kcMediumGreyColor,
                    ),
                    trailingTapped: () => keywordsController.clear(),
                    placeholder: "Enter keywords",
                  ),
                ),
              ),
            ),
            FocusScope(
              child: Focus(
                onFocusChange: model.onFocusChanged,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  margin: model.focus ? EdgeInsets.only(top: 10.0) : EdgeInsets.only(top: 15.0),
                  child: BoxInputField(
                    controller: locationController,
                    leading: Icon(
                      Icons.location_on,
                      color: kcPrimaryColor,
                    ),
                    trailing: Icon(
                      Icons.close,
                      color: kcMediumGreyColor,
                    ),
                    trailingTapped: () => locationController.clear(),
                    placeholder: "Enter suburb, city, or region",
                  ),
                ),
              ),
            ),
            FocusScope(
              child: Focus(
                onFocusChange: model.onFocusChanged,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 400),
                  margin: model.focus ? EdgeInsets.only(top: 10.0) : EdgeInsets.only(top: 15.0),
                  child: BoxInputField(
                    controller: categoryController,
                    leading: Icon(
                      Icons.category,
                      color: kcPrimaryColor,
                    ),
                    trailing: Icon(
                      Icons.close,
                      color: kcMediumGreyColor,
                    ),
                    trailingTapped: () => categoryController.clear(),
                    placeholder: "Any classification",
                  ),
                ),
              ),
            ),
          ],
        ),
        // Makes the button center
      ),
    );
  }
}
