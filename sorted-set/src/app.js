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

  getNextInsertionIndex(node) {
    return this.list.findIndex(el => this.comparator(node, el));
  }

  add(node) {
    const key = this.key(node);
    if (this.keys.hasOwnProperty(key)) return;

    this.keys[key] = true;
    const index = this.getNextInsertionIndex(node);
    index == -1 ? this.list.push(node) : this.list.splice(index, 0, node);
  }
};
