import 'package:authentication/app/app.locator.dart';
import 'package:authentication/ui/job_results/job_results_viewmodel.dart';
import 'package:authentication/ui/shared/styles.dart';
import 'package:authentication/ui/shared/ui_helpers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class JobResultsView extends StatelessWidget {
  final Map<String, String> searchParameters;
  const JobResultsView({super.key, required this.searchParameters});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<JobResultsViewModel>.reactive(
      viewModelBuilder: () => JobResultsViewModel(searchParameters: searchParameters),
      disposeViewModel: false,
      initialiseSpecialViewModelsOnce: true,
      builder: (context, model, child) => Scaffold(
          appBar: AppBar(
            leading: IconButton(icon: const Icon(Icons.arrow_back_ios_new_rounded), onPressed: model.navigateBack),
            backgroundColor: kcPrimaryColor,
            foregroundColor: Colors.black,
            elevation: 0,
            title: const Text('Search Results'),
          ),
          backgroundColor: Colors.white,
          body: model.isBusy
              ? Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(kcPrimaryColor)),
                      Text('Loading Jobs', style: TextStyle(color: Colors.black))
                    ],
                  ),
                )
              : ListView.separated(
                  key: const PageStorageKey('storage-key'),
                  // padding: const EdgeInsets.only(top: 2),
                  separatorBuilder: (context, index) => const Divider(height: 3),
                  itemCount: model.data!.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () => model.browseJob(model.data![index]),
                    child: Container(
                      decoration: BoxDecoration(
                          // color: Colors.black,
                          // borderRadius: BorderRadius.circular(5),
                          ),
                      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              model.data![index].employerLogo != null
                                  ? CachedNetworkImage(
                                      imageUrl: model.data![index].employerLogo!,
                                      imageBuilder: (context, imageProvider) => Container(
                                        height: 35,
                                        width: 35,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: imageProvider, fit: BoxFit.cover, colorFilter: ColorFilter.mode(Colors.red, BlendMode.colorBurn)),
                                        ),
                                      ),
                                      placeholder: (context, url) => CircularProgressIndicator(),
                                      errorWidget: (context, url, error) => Icon(Icons.error),
                                    )
                                  : SizedBox(height: 35, width: 35),
                              const Icon(
                                Icons.bookmark_add_outlined,
                                color: kcPrimaryColor,
                                size: 35,
                              )
                            ],
                          ),
                          verticalSpaceSmall,
                          if (model.data![index].jobTitle != null)
                            Text(
                              model.data![index].jobTitle!,
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              textAlign: TextAlign.start,
                            ),
                          const SizedBox(height: 20),
                          if (model.data![index].jobDescription != null)
                            Text(
                              model.data![index].jobDescription!,
                              maxLines: 15,
                              overflow: TextOverflow.clip,
                              style: bodyStyle.copyWith(color: kcMediumGreyColor),
                            )
                        ],
                      ),
                    ),
                  ),
                )
          // : Container(
          //     color: Colors.red,
          //     alignment: Alignment.center,
          //     child: Text(model.error, style: TextStyle(color: Colors.white, fontSize: 10)),
          //   ),
          ),
    );
  }
}
