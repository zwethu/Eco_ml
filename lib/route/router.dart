import 'package:auto_route/annotations.dart';

import 'package:eco_ml/pages/homePage.dart';
import 'package:eco_ml/pages/pages.dart';
import 'package:eco_ml/pages/profilePage.dart';


    
// @CupertinoAutoRouter    
// @AdaptiveAutoRouter    
// @CustomAutoRouter    
@MaterialAutoRouter(    
  replaceInRouteName: 'Page,Route',    
  routes: <AutoRoute>[    
    AutoRoute(page: HomePage, initial: true),    
    AutoRoute(page: ProfilePage),   
    AutoRoute(page: PiggyPage),   
    AutoRoute(page: CategoriesPage),    
      ],  
)    
class $MyAppRouter {} 