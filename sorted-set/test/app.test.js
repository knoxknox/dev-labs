import { SortedSet } from 'app';

test('constructor', () => {
  const object = new SortedSet();
  expect(object.list).toEqual([1, 2, 3]);
});
