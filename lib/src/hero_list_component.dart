import 'package:angular/angular.dart';
import 'hero.dart';
import 'hero_component.dart';
import 'hero_service.dart';
import 'package:angular_router/angular_router.dart';

@Component(
  selector: 'my-heroes',
  templateUrl: 'hero_list_component.html',
  styleUrls: ['hero_list__component.css'],
  template: '''
  <div *ngIf="hero != null">
    <h2>{{hero.name}}</h2>
    <div><label>id: </label>{{hero.id}}</div>
    <div>
      <label>name: </label>
      <input [(ngModel)]="hero.name" placeholder="name">
    </div>
  </div>''',
  directives: [coreDirectives, HeroCompoenent],
  providers: [ClassProvider(HeroService)],
  pipes: [commonPipes],
)

class HeroListComponent implements OnInit{
  final title = 'Tour of Heroes';
  final HeroService _heroService;
  final Router _router;
  //HeroService heroService = HeroService();
  List<Hero> heroes;
  Hero selected;

  HeroListComponent(this._heroService, this._router);

  void _getHeroes() {
    _heroService.getAll().then((heroes) => this.heroes = heroes);
  }

  void onSelected(Hero hero) => selected = hero;
  void ngOnInit() => _getHeroes;

  Future<NavigationResult> gotoDetail() => null;
}
