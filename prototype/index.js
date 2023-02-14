/**
 * Prints chain of object ancestors.
 */
const ancestors = (root) => {
  let proto = Object.getPrototypeOf(root);

  while (proto) {
    console.log(proto);
    proto = Object.getPrototypeOf(proto);
  }
};
