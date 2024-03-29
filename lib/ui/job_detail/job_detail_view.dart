import 'package:authentication/models/job_post.dart';
import 'package:authentication/ui/shared/styles.dart';
import 'package:authentication/ui/shared/ui_helpers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../widgets/box_button.dart';
import 'job_detail_viewmodel.dart';

class JobDetailView extends StatelessWidget {
  final JobPost jobPost;

  const JobDetailView({super.key, required this.jobPost});

  // Column _getJobHighlights() {
  //   var highlights = const Column();
  //   if (jobPost.jobHighlights != null) {
  //     for
  //   }
  // }

  Text _getJobLocation() {
    var location = "";
    if (jobPost.jobCity != null) {
      location += "${jobPost.jobCity},";
    }
    if (jobPost.jobState != null) {
      location += " ${jobPost.jobState},";
    }
    if (jobPost.jobCountry != null) {
      location += " ${jobPost.jobCountry}";
    }
    location += ",";
    if (location.lastIndexOf(r",") == location.length - 1) {
      location = location.replaceRange(location.length - 1, location.length, '');
    }

    return Text(location.trim());
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<JobDetailViewModel>.reactive(
      viewModelBuilder: () => JobDetailViewModel(jobPost: jobPost),
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      builder: (context, model, child) => Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: BoxButton.outline(
                  title: 'Save',
                  height: 40,
                  // disabled: !model.hasSelectedPlace,
                  onTap: () => {},
                ),
              ),
              horizontalSpaceTiny,
              Expanded(
                flex: 1,
                child: BoxButton(
                  title: 'Quick apply',
                  height: 40,
                  busy: model.isBusy,
                  // disabled: !model.hasSelectedPlace,
                  disabled: false,
                  onTap: () => {},
                ),
              ),
            ],
          ),
        ),
        appBar: AppBar(
          leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded), onPressed: model.navigateBack),
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(jobPost.jobTitle!, style: captionStyle.copyWith(fontWeight: FontWeight.w700)),
              Text(jobPost.employerName!, style: captionStyle),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(height: 80, color: kcLightGreyColor),
              verticalSpaceRegular,
              jobPost.employerLogo != null
                  ? CachedNetworkImage(
                      imageUrl: jobPost.employerLogo!,
                      imageBuilder: (context, imageProvider) => Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: imageProvider, fit: BoxFit.cover, colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
                        ),
                      ),
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                    )
                  : Container(height: 80, width: 80, color: kcPrimaryColor),
              verticalSpaceRegular,
              Text(
                jobPost.jobTitle!,
                style: subheadingStyle.copyWith(fontWeight: FontWeight.w700),
                textAlign: TextAlign.start,
              ),
              verticalSpaceRegular,
              Text(
                jobPost.employerName!,
                style: subheadingStyle,
                textAlign: TextAlign.start,
              ),
              verticalSpaceSmall,
              const Text(
                '19h ago',
                style: captionStyle,
                textAlign: TextAlign.start,
              ),
              verticalSpaceRegular,
              const Divider(height: 3),
              verticalSpaceRegular,
              Row(children: [Icon(Icons.location_on, color: kcPrimaryColor), horizontalSpaceRegular, _getJobLocation()]),
              verticalSpaceRegular,
              Row(
                children: [
                  Icon(Icons.event_note_rounded, color: kcPrimaryColor),
                  horizontalSpaceRegular,
                  Text('Accounts Receivable/Credit Control (Accounting)')
                ],
              ),
              verticalSpaceRegular,
              Row(
                children: [Icon(Icons.access_time_filled_rounded, color: kcPrimaryColor), horizontalSpaceRegular, Text('Full Time')],
              ),
              verticalSpaceRegular,
              const Divider(height: 3),
              verticalSpaceRegular,
              Text('Qualifications', style: bodyStyle.copyWith(fontWeight: FontWeight.w700)),
              verticalSpaceRegular,
              const Padding(
                padding: EdgeInsets.only(left: 25),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('\u2022 Graduate of BS in Accountancy or any accounting-related course', style: bodyStyle),
                  Text('\u2022 With knowledge and understanding of finance reports', style: bodyStyle),
                  Text('\u2022 Knowledgeable in any MS Office applications', style: bodyStyle),
                  Text('\u2022 With basic knowledge of SAP', style: bodyStyle),
                  Text('\u2022 Willing to assign in Ugong, Pasig City', style: bodyStyle),
                ]),
              ),
              verticalSpaceRegular,
              Text('Duties and Responsibilities', style: bodyStyle.copyWith(fontWeight: FontWeight.w700)),
              verticalSpaceRegular,
              const Padding(
                padding: EdgeInsets.only(left: 25),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('\u2022 Prepare and send out Statements of accounts to the SMC business unit', style: bodyStyle),
                  Text('\u2022 Intercompany reconciliation', style: bodyStyle),
                  Text('\u2022 Recording of accruals', style: bodyStyle),
                  Text('\u2022 Reconciliation of Revenues and Receivables GL accounts (SAP vs SOA)', style: bodyStyle),
                  Text('\u2022 Identify and drive process improvements, including creation of standard and ad-hoc reports and tools', style: bodyStyle),
                  Text('\u2022 Prepare the monthly aging of receivables', style: bodyStyle),
                ]),
              ),
              verticalSpaceMassive,
              const Divider(height: 3),
              verticalSpaceMedium,
              Text('Employer questions', style: bodyStyle.copyWith(fontWeight: FontWeight.w500)),
              verticalSpaceRegular,
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 35),
                color: kcLightGreyColor,
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Your application will include the following questions:', style: bodyStyle),
                  verticalSpaceTiny,
                  Text('\u2022 Prepare and send out Statements of accounts to the SMC business unit', style: bodyStyle),
                  verticalSpaceTiny,
                  Text('\u2022 Intercompany reconciliation', style: bodyStyle),
                  verticalSpaceTiny,
                  Text('\u2022 Recording of accruals', style: bodyStyle),
                  verticalSpaceTiny,
                  Text('\u2022 Reconciliation of Revenues and Receivables GL accounts (SAP vs SOA)', style: bodyStyle),
                  verticalSpaceTiny,
                  Text('\u2022 Identify and drive process improvements, including creation of standard and ad-hoc reports and tools', style: bodyStyle),
                  verticalSpaceTiny,
                  Text('\u2022 Prepare the monthly aging of receivables', style: bodyStyle),
                ]),
              ),
              verticalSpaceRegular,
              const Divider(height: 3),
              Text('Employee reviews of Kolin Philippines International', style: bodyStyle.copyWith(fontWeight: FontWeight.w500)),
              verticalSpaceRegular,
              Row(
                children: [
                  Icon(Icons.star_rate_rounded, color: Colors.orange),
                  Icon(Icons.star_rate_rounded, color: Colors.orange),
                  Icon(Icons.star_rate_rounded, color: Colors.orange),
                  Icon(Icons.star_rate_rounded, color: Colors.orange),
                  Icon(Icons.star_rate_rounded, color: Colors.orange),
                  horizontalSpaceSmall,
                  Text('4.3')
                ],
              ),
              verticalSpaceMedium,
              Text('Read reviews', style: TextStyle(color: Colors.blue)),
              verticalSpaceMedium,
              const Divider(height: 3),
              verticalSpaceMedium,
              Text('Be careful', style: bodyStyle.copyWith(fontWeight: FontWeight.w500)),
              verticalSpaceRegular,
              Text('Don\'t provide your bank or credit card details when applying for jobs. ', style: bodyStyle),
              verticalSpaceMedium,
              Text('Learn how to protect yourself', style: TextStyle(color: Colors.blue)),
              verticalSpaceMedium,
              Text('Report this job ad', style: TextStyle(color: Colors.blue)),
              verticalSpaceLarge,
            ]),
          ),
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
