# hash-ring

Consistent Hashing implementation.

Next commands available to run project:
- `npm run test` to run tests with jest runner;
- `npm run lint` to run linter and show warnings;
- `npm run node` to run project with node via babel;

## How it works

Each node in ring has id and weight (default = 20).<br/>
Weight = number of virtual nodes distributed in the ring.<br/>
Example: ring of 2 nodes will contain 2 * 20 (weight) = 40 vnodes.

Each vnode has it's own hash and mapping to the real node.<br/>
Node for `target` calculates based on `bsearch(vnodes, hash(target))`.

```
const ring = {
  // vnode => node
  '0d2aa67997848cc7c4b9513513f08c8e' => 'N',
  '37bea306c48c43be5b3ba4d07cb4e5d2' => 'N',
  '01de2a76a32c70a6c3afe5686bc21409' => 'N',
  '36c26cde06fce1a45b37d03b03b431d1' => 'N',
  '5f9e17e0e0878a6384b2c94238d08ee7' => 'N',
  'dedd95abbf168a60b53c02debbe53221' => 'N',
  'dfbbdcd0c3b4e6df57d1f1f42877d34f' => 'N',
  '5ea798bada8bc59f5f0912655c096844' => 'N',
  '64774a45f72214eb7b08dd35f623f571' => 'N',
  '6824aa4b9d818f51598e68efe9ae86ba' => 'N',
  '3eda697c482df99819d98e1be2fb14ed' => 'N',
  '3dc1163c6ae9e881d44bff9a38bd076b' => 'N',
  '3ba8ae8115fa6f850ec7a3075504b644' => 'N',
  '56051a8eb7788653c5c1b4a0550b17f3' => 'N',
  'ff5b72562a6feab5fc0c33a03372b1b7' => 'N',
  '2181306decd54c142862ec5702832267' => 'N',
  '22bc33fd9539d390c0c6be685507b40a' => 'N',
  '1dcc91deb5956e8651781a7169b962bc' => 'N',
  '5bdcca834ec2a06184151488ef3c5fd5' => 'N',
  '186ffa13489e3f9fc4db71c172d923c4' => 'N',
};
const vnodes = [
  // sorted array for bsearch
  '01de2a76a32c70a6c3afe5686bc21409', // 0
  '0d2aa67997848cc7c4b9513513f08c8e', // 1
  '186ffa13489e3f9fc4db71c172d923c4', // 2
  '1dcc91deb5956e8651781a7169b962bc', // 3
  '2181306decd54c142862ec5702832267', // 4
  '22bc33fd9539d390c0c6be685507b40a', // 5
  '36c26cde06fce1a45b37d03b03b431d1', // 6
  '37bea306c48c43be5b3ba4d07cb4e5d2', // 7
  '3ba8ae8115fa6f850ec7a3075504b644', // 8
  '3dc1163c6ae9e881d44bff9a38bd076b', // 9
  '3eda697c482df99819d98e1be2fb14ed', // 10
  '56051a8eb7788653c5c1b4a0550b17f3', // 11
  '5bdcca834ec2a06184151488ef3c5fd5', // 12
  '5ea798bada8bc59f5f0912655c096844', // 13
  '5f9e17e0e0878a6384b2c94238d08ee7', // 14
  '64774a45f72214eb7b08dd35f623f571', // 15
  '6824aa4b9d818f51598e68efe9ae86ba', // 16
  'dedd95abbf168a60b53c02debbe53221', // 17
  'dfbbdcd0c3b4e6df57d1f1f42877d34f', // 18
  'ff5b72562a6feab5fc0c33a03372b1b7', // 19
];

// example of get node
target A has hash 7fc56270e7a70fa81a5935b72eacbe29
target A position in the ring = 16 (after 682...6ba, before ded...221)

target B has hash 9d5ed678fe57bcca610140957afab571
target B position in the ring = 16 (after 682...6ba, before ded...221)

target C has hash 0d61f8370cad1d412f80b84d143e1257
target C position in the ring = 01 (after 0d2...c8e, before 186...3c4)
```
