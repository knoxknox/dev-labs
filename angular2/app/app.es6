import {Component, Template, bootstrap} from 'angular2/angular2';

@Component({ selector: 'demo-component' })
@Template({ inline: '<h1>Hello {{name}}</h1>' })

class DemoComponent {
  constructor() {
    this.name = 'World';
  }
}

bootstrap(DemoComponent);
