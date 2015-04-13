var UserModel = require('./UserModel');
var UserStore = require('./UsersStore');

var user1 = new UserModel({ name: 'John', identifier: 975842 });
var user2 = new UserModel({ name: 'Khan', identifier: 354210 });
var user3 = new UserModel({ name: 'Xing', identifier: 674988 });

window.user = UserModel;
window.users = new UserStore([user1, user2, user3]); // users.add({ name: 'Test' });
