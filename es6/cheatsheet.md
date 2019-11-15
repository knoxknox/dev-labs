// Declaring Variables

```
let x;
let y;
let z = 3;
```
```
let x, y, z = 3;
```

// JS For Loop Shorthand

```
const fruits = ['mango', 'banana'];
for (let i = 0; i < fruits.length; i++)
```
```
for (let index in fruits)
for (let fruit of fruits)
Object.entries(object).forEach(([key, value]) => {});
```

// Object Property Shorthand

```
const x = 10, y = 20;
const object = { x: x, y: y };
```
```
const object = { x, y }; // => { x: x, y: y }
```

// Arrow Functions Shorthand

```
list.forEach(function(item) { console.log(item); });
function hello(world) { console.log('Hello', world); }
setTimeout(function() { console.log('Loaded') }, 2000);
```
```
list.forEach(item => console.log(item));
hello = world => console.log('Hello', world);
setTimeout(() => console.log('Loaded'), 2000);
```

// Default Parameter Values

```
function f(x, y) {
  x = x || 3;
  y = y || 4;
  return x * y;
}
```
```
f = (x = 3, y = 4) => (x * y);
```

// Template Literals

```
const db = 'http://' + host + ':' + port;
```
```
const db = `http://${host}:${port}`
```

// Destructuring Assignment

```
const form = this.props.form;
const store = this.props.store;
```
```
import { action } from 'mobx';
const { form, store } = this.props;
```

// Spread Operator

```
const list = [1, 2, 3];
const clone = list.slice(); // [1, 2, 3]

const nums = [1, 3, 5];
const join = [2, 4].concat(nums); // [2, 4, 1, 3, 5]
```
```
const list = [1, 2, 3];
const clone = [...list]; // [1, 2, 3]

const nums = [1, 3, 5];
const join1 = [2, 4, ...nums]; // [2, 4, 1, 3, 5]
const join2 = [2, ...nums, 4]; // [2, 1, 3, 5, 4]

const odd = [1, 3, 5];
const even = [2, 4, 6];
const result = [...odd, ...even]; // [1, 3, 5, 2, 4, 6]

const props1 = { id: 1, name: 'JDoe' };
const props2 = { age: 42, country: 'USA' };
const merged = { ...props1, ...props2 } // id, name, age, country
```

// Object Property Assignment

```
const age = { age: 25 };
const name = { name: 'JDoe' };
const result = Object.assign(age, name);
```
```
const result = { ...age, ...name }; // same as assign
```
