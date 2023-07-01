import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_list/features/presesntation/pages/login/bloc/login_bloc.dart';
import 'package:product_list/features/presesntation/pages/login/login_page.dart';
import 'package:product_list/features/presesntation/pages/product_list/bloc/product_list_bloc.dart';
import 'package:product_list/features/presesntation/pages/product_list/product_list_page.dart';
import 'package:product_list/features/presesntation/pages/productdetail/bloc/product_detail_bloc.dart';

import '../../di/injection_container.dart';
import '../../features/presesntation/pages/productdetail/product_detail_page.dart';
import '../../features/presesntation/pages/settings/blocs/settings_blocs.dart';
import '../../features/presesntation/pages/settings/settings_page.dart';
import '../../global.dart';
import 'names.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
          route: AppRoutes.LOGIN_PAGE,
          page: const LoginPage(),
          bloc: BlocProvider(
            create: (_) => sl<LoginBloc>()..add(LoginEventInitial()),
          )),
      PageEntity(
          route: AppRoutes.PRODUCT_LIST_PAGE,
          page: const ProductListPage(),
          bloc: BlocProvider(
            create: (_) => sl<ProductListBloc>()..add(ProductListEventInitial()),
          )),
      PageEntity(
          route: AppRoutes.PRODUCT_DETAIL_PAGE,
          page: const ProductDetailPage(),
          bloc: BlocProvider(
            create: (_) =>
                sl<ProductDetailBloc>()..add(ProductDetailEventInitial()),
          )),
      PageEntity(
          route: AppRoutes.SETTINGS_PAGE,
          page: const SettingsPage(),
          bloc: BlocProvider(
            create: (_) => SettingsBloc(),
          )),
    ];
  }

  //return all the bloc providers
  static List<dynamic> allBlocProviders(
    BuildContext context,
  ) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  //a model that covers entire screen as we click on navigator object
  static MaterialPageRoute generateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      //check for route name matching when navigator gets triggered
      bool isLoggedIn = Global.storageService.getIsLoggedIn();
      if (isLoggedIn) {
        var result = routes().where((element) => element.route == settings.name);
        if (result.isNotEmpty) {
          if (result.first.route == AppRoutes.INITIAL_PAGE) {
            return MaterialPageRoute(
                builder: (_) => const ProductListPage(), settings: settings);
          }
          return MaterialPageRoute(
              builder: (_) => result.first.page, settings: settings);
        }else if(settings.name == AppRoutes.INITIAL_PAGE) {
          return MaterialPageRoute(
              builder: (_) => const ProductListPage(), settings: settings);
        }
        return MaterialPageRoute(
            builder: (_) => const LoginPage(), settings: settings);
      }
    }
    return MaterialPageRoute(
        builder: (_) => const LoginPage(), settings: settings);
  }
}

//unify bloc provider and routes and pages
class PageEntity {
  String route;
  Widget page;
  dynamic bloc;

  PageEntity({required this.route, required this.page, this.bloc});
}
