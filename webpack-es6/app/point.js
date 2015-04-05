class Point {

  constructor(x, y) {
    [this.x, this.y] = [x, y];
  }

  toString() {
    return `${this.x}, ${this.y}`;
  }

}

export default Point;
