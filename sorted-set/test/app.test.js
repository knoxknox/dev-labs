import { SortedSet } from 'app';

test('empty set', () => {
  const expected = [];
  const list = new SortedSet();
  expect(list.values).toEqual(expected);
});

test('sorted set', () => {
  const expected = [
    {id: 8, type: 'create'},
    {id: 8, type: 'delete'},
    {id: 8, type: 'update'},
    {id: 7, type: 'create'},
    {id: 7, type: 'update'},
    {id: 6, type: 'update'},
    {id: 5, type: 'create'},
    {id: 4, type: 'create'},
    {id: 3, type: 'create'},
    {id: 2, type: 'create'},
    {id: 2, type: 'update'},
    {id: 1, type: 'create'},
    {id: 1, type: 'delete'},
    {id: 1, type: 'update'},
  ];

  const list = new SortedSet();
  list.add({id: 2, type: 'update'});
  list.add({id: 1, type: 'create'});
  list.add({id: 3, type: 'create'});
  list.add({id: 5, type: 'create'});
  list.add({id: 4, type: 'create'});
  list.add({id: 7, type: 'update'});
  list.add({id: 8, type: 'update'});
  list.add({id: 6, type: 'update'});
  list.add({id: 2, type: 'create'});
  list.add({id: 1, type: 'update'});
  list.add({id: 7, type: 'create'});
  list.add({id: 8, type: 'delete'});
  list.add({id: 1, type: 'delete'});
  list.add({id: 8, type: 'create'});
  list.add({id: 1, type: 'delete'});
  list.add({id: 8, type: 'create'});
  list.add({id: 1, type: 'delete'});
  list.add({id: 8, type: 'create'});

  expect(list.values).toEqual(expected);
});
