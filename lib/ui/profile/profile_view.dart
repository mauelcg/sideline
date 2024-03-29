import 'package:authentication/ui/profile/profile_viewmodel.dart';
import 'package:authentication/ui/shared/styles.dart';
import 'package:authentication/ui/shared/ui_helpers.dart';
import 'package:authentication/ui/widgets/box_input_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../../app/app.locator.dart';
import '../widgets/box_button.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      viewModelBuilder: () => locator<ProfileViewModel>(),
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.white,
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              expandedHeight: 200,
              floating: true,
              pinned: true,
              title: Text('Mark Lemuel Genita'),
              actions: [Icon(Icons.settings), horizontalSpaceRegular],
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  verticalSpaceRegular,
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Personal summary',
                        style: subheadingStyle.copyWith(fontWeight: FontWeight.w700),
                        textAlign: TextAlign.start,
                      ),
                      if (model.user.personalSummary != null)
                        Text(
                          'Edit',
                          style: bodyStyle.copyWith(fontWeight: FontWeight.w400, color: kcPrimaryColor),
                          textAlign: TextAlign.start,
                        ),
                    ],
                  ),
                  verticalSpaceSmall,
                  if (model.user.personalSummary != null)
                    BoxInputField(
                      placeholder: model.user.personalSummary!,
                      minLines: 3,
                      maxLines: 5,
                      controller: TextEditingController(text: model.user.personalSummary!),
                    ),
                  if (model.user.personalSummary == null)
                    Text(
                      'Add a personal summary to your profile as a way to introduce who you are.',
                      style: bodyStyle.copyWith(color: kcMediumGreyColor),
                      textAlign: TextAlign.start,
                    ),
                  verticalSpaceRegular,
                  if (model.user.personalSummary == null)
                    BoxButton.outline(
                      title: 'Add summary',
                      onTap: () {
                        model.showPersonalSummaryBottomSheet();
                        // var sheetController = showBottomSheet(
                        //   backgroundColor: Colors.transparent,
                        //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                        //   context: context,
                        //   builder: (_) => FloatingBoxBottomSheet(
                        //     request: SheetRequest(title: "aw"),
                        //     completer: (request) => null,
                        //   ),
                        // );
                        // sheetController.closed.then((value) {
                        //   var updates = HashMap<String, dynamic>();
                        //   updates.addAll({'summary': "I am a software engineer! updated!"});
                        //   model.onUserUpdate(updates);
                        // });
                      },
                    ),
                  verticalSpaceMedium,
                  verticalSpaceMedium,
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Career history',
                        style: subheadingStyle.copyWith(fontWeight: FontWeight.w700),
                        textAlign: TextAlign.start,
                      ),
                      TextButton(
                        onPressed: () => model.showCareerHistoryBottomSheet(),
                        child: Text(
                          'Add',
                          style: bodyStyle.copyWith(fontWeight: FontWeight.w400, color: kcPrimaryColor),
                        ),
                      ),
                    ],
                  ),
                  verticalSpaceSmall,
                  // border: circularBorder.copyWith(
                  //   borderSide: BorderSide(color: kcLightGreyColor),
                  // ),
                  Container(
                    // decoration: BoxDecoration(color: kcVeryLightGreyColor, border: circularBorder.copyWith(borderSide: BorderSide(color: kcLightGreyColor))),
                    decoration: BoxDecoration(border: Border.all(color: kcLightGreyColor), color: kcVeryLightGreyColor, borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Freelance Software Developer", style: bodyStyle.copyWith(fontWeight: FontWeight.w600)),
                            const Icon(Icons.more_vert_rounded)
                          ],
                        ),
                        Text("Self Employed", style: captionStyle),
                        verticalSpaceRegular,
                        Text("Mar 2020 - Oct 2022 (2 years 7 months)", style: bodyStyle)
                      ],
                    ),
                  ),
                  verticalSpaceMedium,
                  verticalSpaceMedium,
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Education',
                        style: subheadingStyle.copyWith(fontWeight: FontWeight.w700),
                        textAlign: TextAlign.start,
                      ),
                      TextButton(
                        onPressed: () => model.showEducationBottomSheet(),
                        child: Text(
                          'Add',
                          style: bodyStyle.copyWith(fontWeight: FontWeight.w400, color: kcPrimaryColor),
                        ),
                      ),
                    ],
                  ),
                  verticalSpaceSmall,
                  // border: circularBorder.copyWith(
                  //   borderSide: BorderSide(color: kcLightGreyColor),
                  // ),
                  Container(
                    // decoration: BoxDecoration(color: kcVeryLightGreyColor, border: circularBorder.copyWith(borderSide: BorderSide(color: kcLightGreyColor))),
                    decoration: BoxDecoration(border: Border.all(color: kcLightGreyColor), color: kcVeryLightGreyColor, borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("BSc in Mechanical Engineering", style: bodyStyle.copyWith(fontWeight: FontWeight.w600)),
                            const Icon(Icons.more_vert_rounded)
                          ],
                        ),
                        Text("University of Cebu", style: captionStyle),
                        verticalSpaceRegular,
                        Text("Finished in 2022", style: bodyStyle)
                      ],
                    ),
                  ),
                  verticalSpaceMedium,
                  verticalSpaceMedium,
                  Text(
                    'Licenses',
                    style: subheadingStyle.copyWith(fontWeight: FontWeight.w700),
                    textAlign: TextAlign.start,
                  ),
                  verticalSpaceRegular,
                  Text("Showcase your licenses, certificates, memberships and accreditations.", style: bodyStyle.copyWith(fontWeight: FontWeight.w400)),
                  verticalSpaceRegular,
                  BoxButton.outline(
                    title: 'Add license',
                    onTap: () {
                      model.showLicensesBottomSheet();
                    },
                  ),
                  verticalSpaceMedium,
                  verticalSpaceMedium,
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Skills',
                        style: subheadingStyle.copyWith(fontWeight: FontWeight.w700),
                        textAlign: TextAlign.start,
                      ),
                      TextButton(
                        onPressed: () => model.showSkillsBottomSheet(),
                        child: Text(
                          'Add',
                          style: bodyStyle.copyWith(fontWeight: FontWeight.w400, color: kcPrimaryColor),
                        ),
                      ),
                    ],
                  ),
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
                  verticalSpaceMedium,
                  verticalSpaceMedium,
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Languages',
                        style: subheadingStyle.copyWith(fontWeight: FontWeight.w700),
                        textAlign: TextAlign.start,
                      ),
                      TextButton(
                        onPressed: () => model.showLanguagesBottomSheet(),
                        child: Text(
                          'Add',
                          style: bodyStyle.copyWith(fontWeight: FontWeight.w400, color: kcPrimaryColor),
                        ),
                      ),
                    ],
                  ),
                  verticalSpaceSmall,
                  // border: circularBorder.copyWith(
                  //   borderSide: BorderSide(color: kcLightGreyColor),
                  // ),
                  Container(
                    // decoration: BoxDecoration(color: kcVeryLightGreyColor, border: circularBorder.copyWith(borderSide: BorderSide(color: kcLightGreyColor))),
                    decoration: BoxDecoration(border: Border.all(color: kcLightGreyColor), color: kcVeryLightGreyColor, borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("English", style: bodyStyle.copyWith(fontWeight: FontWeight.w600)), const Icon(Icons.more_vert_rounded)],
                    ),
                  ),
                  verticalSpaceSmall,
                  Container(
                    // decoration: BoxDecoration(color: kcVeryLightGreyColor, border: circularBorder.copyWith(borderSide: BorderSide(color: kcLightGreyColor))),
                    decoration: BoxDecoration(border: Border.all(color: kcLightGreyColor), color: kcVeryLightGreyColor, borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Filipino", style: bodyStyle.copyWith(fontWeight: FontWeight.w600)), const Icon(Icons.more_vert_rounded)],
                    ),
                  ),
                  verticalSpaceMedium,
                  verticalSpaceMedium,
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Resumes',
                        style: subheadingStyle.copyWith(fontWeight: FontWeight.w700),
                        textAlign: TextAlign.start,
                      ),
                      Text(
                        'Upload',
                        style: bodyStyle.copyWith(fontWeight: FontWeight.w400, color: kcPrimaryColor),
                        textAlign: TextAlign.start,
                      ),
                    ],
                  ),
                  verticalSpaceMedium,
                  Container(
                    // decoration: BoxDecoration(color: kcVeryLightGreyColor, border: circularBorder.copyWith(borderSide: BorderSide(color: kcLightGreyColor))),
                    decoration: BoxDecoration(border: Border.all(color: kcLightGreyColor), color: kcVeryLightGreyColor, borderRadius: BorderRadius.circular(8)),
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("BSc in Mechanical Engineering", style: bodyStyle.copyWith(fontWeight: FontWeight.w600)),
                            const Icon(Icons.more_vert_rounded)
                          ],
                        ),
                        Text("University of Cebu", style: captionStyle),
                        verticalSpaceRegular,
                        Text("Finished in 2022", style: bodyStyle)
                      ],
                    ),
                  ),
                  verticalSpaceRegular,
                  const BoxButton.outline(title: 'See all (1)'),
                  verticalSpaceLarge
                ]),
              ),
            ),
          ],
        ),
        // : Container(
        //     color: Colors.red,
        //     alignment: Alignment.center,
        //     child: Text(model.error, style: TextStyle(color: Colors.white, fontSize: 10)),
        //   ),
      ),
    );
  }
}
