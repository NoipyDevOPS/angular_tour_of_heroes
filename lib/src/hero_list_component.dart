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

  Future<void> _getHeroes() async {
    heroes = await _heroService.getAll();
  }

  void ngOnInit() => _getHeroes;

  void onSelected(Hero hero) => selected = hero;
  
  String _heroUrl(int id) => RoutePaths.hero.toUrl(parameters: {idParam: '$id'});

  Future<NavigationResult> gotoDetail() => _router.navigate(_heroUrl(selected.id));

  Future<void> add(String name) async {
    name = name.trim();  
    if(name.isEmpty) return null;
    heroes.add(await _heroService.create(name));
    selected = null;
  }

  Future<void> delete(Hero hero) async {
    await _heroService.delete(hero.id);
    hero.remove(hero);
    if(selected == hero) selected = null;
  }
}

