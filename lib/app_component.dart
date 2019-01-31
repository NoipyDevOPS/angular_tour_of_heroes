import 'package:angular/angular.dart';
import 'src/hero.dart';
import 'src/mock_heroes.dart';
import 'package:angular_forms/angular_forms.dart';

@Component(
  selector: 'my-hero',
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
  directives: [coreDirectives, formDirectives],
)

class AppComponent {
  //var name = 'Angular Dart';
  final title = 'Tour of Heroes';
  List<Hero> heroes = mockHeroes;
  Hero selected;

  void onSelected(Hero hero) => selected = hero;
}

class HeroComponent {

}

