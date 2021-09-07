import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:eco_ml/pages/NameInputPage.dart';
import 'package:eco_ml/pages/amountInputPage.dart';
import 'package:eco_ml/pages/pages.dart';
import 'package:eco_ml/pages/transactionPage.dart';
  
// @CupertinoAutoRouter    
// @AdaptiveAutoRouter    
// @CustomAutoRouter    
@MaterialAutoRouter(    
  replaceInRouteName: 'Page,Route',    
  routes: <AutoRoute>[    
    AutoRoute(page: SplashPage,initial: true), 
    AutoRoute(page: OnboardPage),
    AutoRoute(page: HomePage),
    AutoRoute(page: ProfilePage),
    AutoRoute(page: CategoriesPage),
    AutoRoute(page: BankPage),
    AutoRoute(page: PiggyPage),
    AutoRoute(page: PiggyHomePage), 
    AutoRoute(page: NameInputPage),
    AutoRoute(page: AmountInputPage),
    AutoRoute(page: TransactionPage),
      ],  
)    
class $MyAppRouter{}