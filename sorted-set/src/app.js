/**
 * Sort key consists from id and weight.
 * Higher weight has sort priority to the top.
 *
 * Example:
 * {id: 7, type: 'create'} => weight = 7 * 10 + 2
 * {id: 7, type: 'update'} => weight = 7 * 10 + 0
 */
const weights = { create: 2, delete: 1, update: 0 };

export class SortedSet {
  constructor() {
    this.keys = {};
    this.list = [];
  }

  get values() {
    return this.list;
  }

  add(node) {
    const key = this._key(node);
    if (hasOwnProperty.call(this.keys, key)) return;

    this.keys[key] = true;
    this.list.splice(this._getInsertionIndex(node), 0, node);
  }

  _key(node) {
    return node.id * 10 + weights[node.type];
  }

  _comparator(node1, node2) {
    return this._key(node1) >= this._key(node2);
  }

  _getInsertionIndex(node) {
    let low = 0;
    let high = this.list.length;

    while (low < high) {
      const mid = (low + high) >>> 1;
      const computed = this.list[mid];
      this._comparator(node, computed) ? high = mid : low = mid + 1;
    }

    return high;
  }
}
