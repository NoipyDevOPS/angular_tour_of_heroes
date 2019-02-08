import 'package:angular/angular.dart';
import 'package:angular_forms/angular_forms.dart';
import 'hero.dart';
import 'package:angular_router/angular_router.dart';
import 'hero_service.dart';
import 'route_paths.dart';

@Component(
  selector: 'my-hero',
  templateUrl: 'hero_component.html',
  template:'''
    <div *ngIf="hero != null">
      <h2>{{hero.name}}</h2>
      <div><label>id: </label>{{hero.id}}</div>
      <div>
        <label>name: </label>
        <input [(ngModel)]="hero.name" placeholder="name">
      </div>
    </div>''',
  styleUrls: ['hero_component.css'],
  directives: [coreDirectives, formDirectives],
)

class HeroCompoenent implements OnActivate {
  @Input()
  Hero hero;
  final HeroService _heroService;
  final Location _location;

  HeroCompoenent(this._heroService, this._location);

  @override
  void onActivate(_, RouterState current) async {
    final id = getId(current.parameters);
    if(id != null) hero = await (_heroService.get(id));
    
  }

  void goBack() => _location.back();
}