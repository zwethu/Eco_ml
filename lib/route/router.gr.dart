// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../pages/amountChangePage.dart' as _i8;
import '../pages/amountInputPage.dart' as _i5;
import '../pages/historyPage.dart' as _i7;
import '../pages/imagePage.dart' as _i10;
import '../pages/nameChangePage.dart' as _i9;
import '../pages/NameInputPage.dart' as _i4;
import '../pages/pages.dart' as _i3;
import '../pages/transactionPage.dart' as _i6;

class MyAppRouter extends _i1.RootStackRouter {
  MyAppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SplashRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.SplashPage();
        }),
    OnboardRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.OnboardPage();
        }),
    HomeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.HomePage();
        }),
    ProfileRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.ProfilePage();
        }),
    CategoriesRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.CategoriesPage();
        }),
    BankRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.BankPage();
        }),
    PiggyRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.PiggyPage();
        }),
    PiggyHomeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<PiggyHomeRouteArgs>(
              orElse: () => const PiggyHomeRouteArgs());
          return _i3.PiggyHomePage(key: args.key);
        }),
    NameInputRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.NameInputPage();
        }),
    AmountInputRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i5.AmountInputPage();
        }),
    TransactionRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i6.TransactionPage();
        }),
    HistoryRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<HistoryRouteArgs>();
          return _i7.HistoryPage(key: args.key, index: args.index);
        }),
    AmountChangeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i8.AmountChangePage();
        }),
    NameChangeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i9.NameChangePage();
        }),
    ImageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i10.ImagePage();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(SplashRoute.name, path: '/'),
        _i1.RouteConfig(OnboardRoute.name, path: '/onboard-page'),
        _i1.RouteConfig(HomeRoute.name, path: '/home-page'),
        _i1.RouteConfig(ProfileRoute.name, path: '/profile-page'),
        _i1.RouteConfig(CategoriesRoute.name, path: '/categories-page'),
        _i1.RouteConfig(BankRoute.name, path: '/bank-page'),
        _i1.RouteConfig(PiggyRoute.name, path: '/piggy-page'),
        _i1.RouteConfig(PiggyHomeRoute.name, path: '/piggy-home-page'),
        _i1.RouteConfig(NameInputRoute.name, path: '/name-input-page'),
        _i1.RouteConfig(AmountInputRoute.name, path: '/amount-input-page'),
        _i1.RouteConfig(TransactionRoute.name, path: '/transaction-page'),
        _i1.RouteConfig(HistoryRoute.name, path: '/history-page'),
        _i1.RouteConfig(AmountChangeRoute.name, path: '/amount-change-page'),
        _i1.RouteConfig(NameChangeRoute.name, path: '/name-change-page'),
        _i1.RouteConfig(ImageRoute.name, path: '/image-page')
      ];
}

class SplashRoute extends _i1.PageRouteInfo {
  const SplashRoute() : super(name, path: '/');

  static const String name = 'SplashRoute';
}

class OnboardRoute extends _i1.PageRouteInfo {
  const OnboardRoute() : super(name, path: '/onboard-page');

  static const String name = 'OnboardRoute';
}

class HomeRoute extends _i1.PageRouteInfo {
  const HomeRoute() : super(name, path: '/home-page');

  static const String name = 'HomeRoute';
}

class ProfileRoute extends _i1.PageRouteInfo {
  const ProfileRoute() : super(name, path: '/profile-page');

  static const String name = 'ProfileRoute';
}

class CategoriesRoute extends _i1.PageRouteInfo {
  const CategoriesRoute() : super(name, path: '/categories-page');

  static const String name = 'CategoriesRoute';
}

class BankRoute extends _i1.PageRouteInfo {
  const BankRoute() : super(name, path: '/bank-page');

  static const String name = 'BankRoute';
}

class PiggyRoute extends _i1.PageRouteInfo {
  const PiggyRoute() : super(name, path: '/piggy-page');

  static const String name = 'PiggyRoute';
}

class PiggyHomeRoute extends _i1.PageRouteInfo<PiggyHomeRouteArgs> {
  PiggyHomeRoute({_i2.Key? key})
      : super(name,
            path: '/piggy-home-page', args: PiggyHomeRouteArgs(key: key));

  static const String name = 'PiggyHomeRoute';
}

class PiggyHomeRouteArgs {
  const PiggyHomeRouteArgs({this.key});

  final _i2.Key? key;
}

class NameInputRoute extends _i1.PageRouteInfo {
  const NameInputRoute() : super(name, path: '/name-input-page');

  static const String name = 'NameInputRoute';
}

class AmountInputRoute extends _i1.PageRouteInfo {
  const AmountInputRoute() : super(name, path: '/amount-input-page');

  static const String name = 'AmountInputRoute';
}

class TransactionRoute extends _i1.PageRouteInfo {
  const TransactionRoute() : super(name, path: '/transaction-page');

  static const String name = 'TransactionRoute';
}

class HistoryRoute extends _i1.PageRouteInfo<HistoryRouteArgs> {
  HistoryRoute({_i2.Key? key, required dynamic index})
      : super(name,
            path: '/history-page',
            args: HistoryRouteArgs(key: key, index: index));

  static const String name = 'HistoryRoute';
}

class HistoryRouteArgs {
  const HistoryRouteArgs({this.key, required this.index});

  final _i2.Key? key;

  final dynamic index;
}

class AmountChangeRoute extends _i1.PageRouteInfo {
  const AmountChangeRoute() : super(name, path: '/amount-change-page');

  static const String name = 'AmountChangeRoute';
}

class NameChangeRoute extends _i1.PageRouteInfo {
  const NameChangeRoute() : super(name, path: '/name-change-page');

  static const String name = 'NameChangeRoute';
}

class ImageRoute extends _i1.PageRouteInfo {
  const ImageRoute() : super(name, path: '/image-page');

  static const String name = 'ImageRoute';
}
