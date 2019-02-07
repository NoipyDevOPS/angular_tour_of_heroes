import 'package:angular/angular.dart';
import 'src/hero_service.dart';
import 'src/hero_list_component.dart';
import 'package:angular_router/angular_router.dart';

@Component(
  selector: 'my-app',
  template: '''
  <h1>{{title}}</h1>
  <my-heroes></my-heroes>
  ''',
  directives: [HeroListComponent],
  providers: [ClassProvider(HeroService)],
)

AppComponent() {
  final title = 'Tour of Heroes';
}