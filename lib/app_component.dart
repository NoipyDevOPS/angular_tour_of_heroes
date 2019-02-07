import 'package:angular/angular.dart';
import 'src/hero.dart';
import 'src/hero_component.dart';
import 'src/hero_service.dart';


@Component(
  selector: 'my-app',
  templateUrl: 'app_component.html',
  styleUrls: ['app_component.css'],
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
)

class AppComponent implements OnInit{
  final title = 'Tour of Heroes';
  final HeroService _heroService;
  HeroService heroService = HeroService();
  List<Hero> heroes;
  Hero selected;

  AppComponent(this._heroService);

  void _getHeroes() {
    _heroService.getAll().then((heroes) => this.heroes = heroes);
  }

  void onSelected(Hero hero) => selected = hero;
  void ngOnInit() => _getHeroes;
}
