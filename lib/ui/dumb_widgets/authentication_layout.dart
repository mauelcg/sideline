import 'package:flutter/material.dart';

import '../shared/styles.dart';
import '../shared/ui_helpers.dart';

class AuthenticationLayout extends StatelessWidget {
  final String title;
  final String subtitle;
  final String mainButtonTitle;
  final Widget form;
  final bool showTermsText;
  late Function? onMainButtonTapped;
  late Function? onCreateAccountTapped;
  late Function? onForgetPasswordTapped;
  late Function? onBackPressed;
  final String? validationMessage;
  final bool busy;

  AuthenticationLayout({
    required this.title,
    required this.subtitle,
    required this.form,
    required this.onMainButtonTapped,
    this.validationMessage,
    Key? key,
    Function? onCreateAccountTapped,
    Function? onForgetPasswordTapped,
    Function? onBackPressed,
    this.mainButtonTitle = 'CONTINUE',
    this.showTermsText = false,
    this.busy = false,
  }) : super(key: key) {
    this.onCreateAccountTapped = onCreateAccountTapped;
    this.onForgetPasswordTapped = onForgetPasswordTapped;
    this.onBackPressed = onBackPressed;
  }

  void base() {
    throw ErrorWidget.withDetails(
      message: "Invalid call to function",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ListView(children: [
        if (onBackPressed == null) verticalSpaceLarge,
        if (onBackPressed != null) verticalSpaceRegular,
        if (onBackPressed != null)
          IconButton(
            onPressed: () {
              onBackPressed!();
            },
            padding: EdgeInsets.zero,
            alignment: Alignment.centerLeft,
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        Text(
          title,
          style: TextStyle(fontSize: 34),
        ),
        verticalSpaceSmall,
        SizedBox(
          width: screenWidthPercentage(context, percentage: 0.7),
          child: Text(
            subtitle,
            style: ktsMediumGreyBodyText,
          ),
        ),
        verticalSpaceRegular,
        form,
        verticalSpaceRegular,
        if (onForgetPasswordTapped != null)
          Align(
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: onForgetPasswordTapped!(),
              child: Text(
                'Forgot Password',
                style: ktsMediumGreyBodyText.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        verticalSpaceRegular,
        if (validationMessage != null)
          Text(
            validationMessage!,
            style: TextStyle(color: Colors.red, fontSize: 16),
          ),
        if (validationMessage != null) verticalSpaceRegular,
        GestureDetector(
          onTap: () {
            onMainButtonTapped!();
          },
          child: Container(
            width: double.infinity,
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: kcPrimaryColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: busy
                ? CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.white),
                  )
                : Text(
                    mainButtonTitle,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                  ),
          ),
        ),
        verticalSpaceRegular,
        if (onCreateAccountTapped != null)
          GestureDetector(
            onTap: () {
              onCreateAccountTapped!();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account?'),
                horizontalSpaceTiny,
                Text(
                  'Create an account',
                  style: TextStyle(color: kcPrimaryColor),
                ),
              ],
            ),
          ),
        if (showTermsText)
          Text(
            'By signing up you agree to our terms, conditions and privacy Policy.',
            style: ktsMediumGreyBodyText,
            textAlign: TextAlign.center,
          )
      ]),
    );
  }
}
