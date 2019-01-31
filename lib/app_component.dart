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

class AppComponent {
  //var name = 'Angular Dart';
  final title = 'Tour of Heroes';
  final HeroService _heroService;
  HeroService heroService = HeroService();
  List<Hero> heroes;
  Hero selected;

  void onSelected(Hero hero) => selected = hero;
  
  AppComponent(this._heroService);

  void _getHeroes() {
    heroes = _heroService.getAll();
  }
}
