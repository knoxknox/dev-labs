/**
 * Sort key consists from id and weight.
 * Higher weight has sort priority to the top.
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

  key(node) {
    return +`${node.id}${weights[node.type]}`;
  }

  comparator(node1, node2) {
    return this.key(node1) >= this.key(node2);
  }

  add(node) {
    const key = this.key(node);
    if (this.keys.hasOwnProperty(key)) return;

    this.keys[key] = true;
    this.list.splice(this.getInsertionIndex(node), 0, node);
  }

  getInsertionIndex(node) {
    let low = 0;
    let high = this.list.length;

    while (low < high) {
      const mid = (low + high) >>> 1;
      const computed = this.list[mid];
      this.comparator(node, computed) ? high = mid : low = mid + 1;
    }

    return high;
  }
};
