import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/features/presesntation/pages/settings/widgets/settings_widgets.dart';

import '../../../../core/routes/names.dart';
import '../../../../core/utils/constant.dart';
import '../../../../global.dart';
import 'blocs/settings_blocs.dart';
import 'blocs/settings_states.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  void removeUserData() {
    Global.storageService.remove(AppConstants.STORAGE_USER_TOKEN_KEY);
    Global.storageService.remove(AppConstants.STORAGE_PRODUCT_ID_KEY);
    Navigator.of(context)
        .pushNamedAndRemoveUntil(AppRoutes.LOGIN_PAGE, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: buildAppbar(),
      body: SingleChildScrollView(
          child: BlocBuilder<SettingsBloc, SettingsState>(builder: (context, state) {
        return Container(
          child: Column(
            children: [
              settingsButton(context, removeUserData),
            ],
          ),
        );
      })),
    );
  }
}
