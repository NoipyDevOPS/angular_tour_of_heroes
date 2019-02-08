import 'package:angular/angular.dart';
import 'hero.dart';
import 'hero_service.dart';
import 'route_paths.dart';

@Component(
  selector: 'my-dashboard',
  template: '<h3>Dashboard</h3>',
  templateUrl: 'dashboard_component.html',
  directives: [coreDirectives],
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