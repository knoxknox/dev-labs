## Modules

```es6
// lib/math.js
export const pi = 3.14;
export function sum(x, y) { return x + y; }
```
```es6
import * as math from 'lib/math';
import { pi, sum } from 'lib/math';
console.log(pi, sum, math.pi, math.sum);
```
```es6
export * from 'lib/math';
export const e = 2.71828182846;
export default function(x) { return Math.log(x); }
// default exports one thing (class/function/primitive)
import ln, { e, pi } from 'lib/exports'; // => e, pi, ln
```

## Declaring Variables

```es6
let x;
let y;
let z = 3;
```
```es6
let x, y, z = 3;
```

## JS For Loop Shorthand

```es6
const fruits = ['mango', 'banana'];
for (let i = 0; i < fruits.length; i++)
```
```es6
for (let index in fruits)
for (let fruit of fruits)
Object.entries(object).forEach(([key, value]) => {});
```

## Object Property Shorthand

```es6
const x = 10, y = 20;
const object = { x: x, y: y };
```
```es6
const object = { x, y }; // => { x: x, y: y }
```

## Arrow Functions Shorthand

```es6
list.forEach(function(item) { console.log(item); });
function hello(world) { console.log('Hello', world); }
setTimeout(function() { console.log('Loaded') }, 2000);
```
```es6
list.forEach(item => console.log(item));
hello = world => console.log('Hello', world);
setTimeout(() => console.log('Loaded'), 2000);
```

## Default Parameter Values

```es6
function f(x, y) {
  x = x || 3;
  y = y || 4;
  return x * y;
}
```
```es6
f = (x = 3, y = 4) => (x * y);
```

## Template Literals

```es6
const db = 'http://' + host + ':' + port;
```
```es6
const db = `http://${host}:${port}`
```

## Destructuring Assignment

```es6
const form = this.props.form;
const store = this.props.store;
```
```es6
import { action } from 'mobx';
const { form, store } = this.props;
```

## Spread Operator

```es6
const list = [1, 2, 3];
const clone = list.slice(); // [1, 2, 3]

const nums = [1, 3, 5];
const join = [2, 4].concat(nums); // [2, 4, 1, 3, 5]
```
```es6
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

## Object Property Assignment

```es6
const age = { age: 25 };
const name = { name: 'JDoe' };
const result = Object.assign(age, name);
```
```es6
const result = { ...age, ...name }; // same as assign
```
