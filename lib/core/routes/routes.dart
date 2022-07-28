import '../../modules/home/page/home_page_route.dart';
import '../../widget/routes/page_route.dart';
import '../../widget/routes/page_route_arguments.dart';

class Routes {
  static List<IPageRoute<IPageRouteArguments>> get() => [
        HomePageRoute(),
      ];
}
