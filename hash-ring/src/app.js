import crypto from 'crypto';

export class HashRing {
  constructor() {
    this.ring = {};
    this.keys = [];
    this.nodes = [];
    this.weight = 20;
    this.algorithm = 'md5';
  }

  add(node) {
    this.nodes.push(node);

    for (let i = 0; i < this.weight; i++) {
      const key = this.key(node, i);

      this.keys.push(key);
      this.ring[key] = node;
    }

    this.keys.sort();
  }

  remove(node) {
    const index = this.nodes.indexOf(node);
    index > -1 && this.nodes.splice(index, 1);

    for (let i = 0; i < this.weight; i++) {
      const key = this.key(node, i);

      delete this.ring[key];
      const index = this.keys.indexOf(key);
      index > -1 && this.keys.splice(index, 1);
    }
  }

  getNode(target) {
    const hash = this.crypto(target);
    const index = this.getNodePosition(hash);

    return this.ring[this.keys[index]];
  }

  getNodePosition(hash) {
    let low = 0;
    let high = this.length - 1;
    if (high === 0 || hash.length <= 0) return 0;

    while (low <= high) {
      const mid = (low + high) >>> 1;
      const computed = this.keys[mid];

      if (hash === computed) return 0;
      // JS compares strings char by char (ascii)
      hash > computed ? low = mid + 1 : high = mid - 1;
    }

    return high < 0 ? this.length - 1 : high;
  }

  key(node, id) {
    return this.crypto(`${node}:${id}`);
  }

  get length() {
    return Object.keys(this.ring).length;
  }

  crypto(string) {
    return crypto.createHash(this.algorithm).update(string).digest('hex');
  }
}
