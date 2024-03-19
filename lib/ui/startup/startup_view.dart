import 'package:authentication/ui/startup/startup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class StartUpView extends StatelessWidget {
  const StartUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartUpViewModel>.reactive(
      viewModelBuilder: () => StartUpViewModel(),
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Text('Startup View'),
        ),
      ),
    );
  }
}
