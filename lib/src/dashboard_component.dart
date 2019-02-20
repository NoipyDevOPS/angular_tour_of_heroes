import 'package:angular/angular.dart';
import 'hero.dart';
import 'hero_service.dart';
import 'route_paths.dart';
import 'hero_search_component.dart';
import 'package:angular_router/angular_router.dart';

@Component(
  selector: 'my-dashboard',
  styleUrls: ['dashboard_component.css'],
  templateUrl: 'dashboard_component.html',
  directives: [coreDirectives, HeroSearchComponent, routerDirectives],
)

class DashboardComponent implements OnInit {
  List<Hero> heroes;
  final HeroService _heroService;
  DashboardComponent(this._heroService);

  @override
  void ngOnInit() async {
    heroes = (await _heroService.getAll()).skip(1).take(4).toList();
  }

  String heroUrl(int id) => RoutePaths.hero.toUrl(parameters: {idParam: '$id'});
}