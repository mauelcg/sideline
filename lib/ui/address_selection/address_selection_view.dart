import 'package:authentication/ui/shared/styles.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'address_selection_viewmodel.dart';

class AddressSelectionView extends StatelessWidget {
  const AddressSelectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddressSelectionViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: kcPrimaryColor,
        ),

        // Makes the button center
      ),
      viewModelBuilder: () => AddressSelectionViewModel(),
    );
  }
}
