import 'package:auto_route/annotations.dart';
import 'package:eco_ml/pages/homePage.dart';
import 'package:eco_ml/pages/profilePage.dart';
import 'package:eco_ml/pages/reportPage.dart';

    
// @CupertinoAutoRouter    
// @AdaptiveAutoRouter    
// @CustomAutoRouter    
@MaterialAutoRouter(    
  replaceInRouteName: 'Page,Route',    
  routes: <AutoRoute>[    
    AutoRoute(page: HomePage, initial: true),    
    AutoRoute(page: ProfilePage),   
    AutoRoute(page: ReportPage),    
       
  ],  
)    
class $MyAppRouter {} 