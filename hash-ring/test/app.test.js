import { HashRing } from 'app';

describe('ring', () => {
  const expectedNode1Keys = [
    '01de2a76a32c70a6c3afe5686bc21409',
    '0d2aa67997848cc7c4b9513513f08c8e',
    '186ffa13489e3f9fc4db71c172d923c4',
    '1dcc91deb5956e8651781a7169b962bc',
    '2181306decd54c142862ec5702832267',
    '22bc33fd9539d390c0c6be685507b40a',
    '36c26cde06fce1a45b37d03b03b431d1',
    '37bea306c48c43be5b3ba4d07cb4e5d2',
    '3ba8ae8115fa6f850ec7a3075504b644',
    '3dc1163c6ae9e881d44bff9a38bd076b',
    '3eda697c482df99819d98e1be2fb14ed',
    '56051a8eb7788653c5c1b4a0550b17f3',
    '5bdcca834ec2a06184151488ef3c5fd5',
    '5ea798bada8bc59f5f0912655c096844',
    '5f9e17e0e0878a6384b2c94238d08ee7',
    '64774a45f72214eb7b08dd35f623f571',
    '6824aa4b9d818f51598e68efe9ae86ba',
    'dedd95abbf168a60b53c02debbe53221',
    'dfbbdcd0c3b4e6df57d1f1f42877d34f',
    'ff5b72562a6feab5fc0c33a03372b1b7',
  ];

  const expectedNode2Keys = [
    '0ea4519470a8b41835373aebdd144d9a',
    '172be70d5ab0ef320ca298ca3262c5c8',
    '19a22a11b946212160768634efac3dca',
    '2c52769efe4a59849664f6a27a0274a9',
    '38ec88a10b22cd7878758dc2c016f746',
    '3dd937c46390ad8e16a116e2af625e04',
    '476aa3345d8c4f2d2255a72ff3b5b7f9',
    '50294f5878205ee2d59416f0852b2ec8',
    '5726b7d4d22a3778fdf5a574ba5382ae',
    '5899065cb8f58c53d9d70e5ab8ea37cb',
    '5a16d7e6a50b6512c4dbba19c430c1c9',
    '7301aa860025808c1d3157780ef0f2b5',
    '811fdb793f5c646bfadf638c8fd9724d',
    'b03ee9b638041b38d633083eb230003f',
    'b1aec016b871541e8355a11909f6fa26',
    'b6d17fc300eef17e0f4ec579569d4ee7',
    'c4f94b42f6a2db3f8407bd46e42ef355',
    'd720751d859865fe03a8c32622218a6b',
    'e969ac604cfe43bf7e73d65c1ad25bb8',
    'fbd5a7d087bd1b8e03fafe4d58f1d5d3',
  ];

  const expectedNode3Keys = [
    '01fd2fc3420067c2f17d382789607db3',
    '05f9c3f28d52b4b74a57d615d2304499',
    '23037776686fb8e31d51ceaf536d5745',
    '2c34dc27ff9bdf320ecec2078cf18eac',
    '3703395a6d47cd51f1860d7649249e9a',
    '66af102c72cfcf2f80a46614248f2aae',
    '76a499a841631263a3b03f20a0010686',
    '8222a8a1d6d671fe49fa321fd023dd50',
    '837fa9c3329b49cd1dd2d45ab9a6d72a',
    '899a2689c0613bb7e51915c57e505122',
    '932cdd9ffd3323af4bbd4e8c51fa8583',
    '96428ea413da5736572268a111fd35f4',
    '9ee7562cdb5769af72f7997e8dbaf845',
    'a7b60a3cb5cee9910049f78b8643b873',
    'a9c2eb78bbee65f2ed5907e9995bb0d3',
    'aff0f658a6cd5e2de93f42e0c608905f',
    'b2d0984d976250b2907a8c276d87fac4',
    'c566dc870d9c699d4e0c7778db92afc6',
    'cc365d845a1ef495ff0597eda3f72784',
    'f80fb395eee08e22a130c67bfbad783c',
  ];

  describe('#add', () => {
    it('adds 20 vnodes for 1 node(s)', () => {
      const ring = new HashRing();
      const expected = expectedNode1Keys.sort();

      ring.add('node1');
      expect(ring.length).toBe(20);
      expect(ring.keys).toEqual(expected);
      expect(ring.nodes).toEqual(['node1']);
    });

    it('adds 40 vnodes for 2 node(s)', () => {
      const ring = new HashRing();
      const expected = [...expectedNode1Keys, ...expectedNode2Keys].sort();

      ring.add('node1');
      ring.add('node2');
      expect(ring.length).toBe(40);
      expect(ring.keys).toEqual(expected);
      expect(ring.nodes).toEqual(['node1', 'node2']);
    });

    it('adds 60 vnodes for 3 node(s)', () => {
      const ring = new HashRing();
      const expected = [...expectedNode1Keys, ...expectedNode2Keys, ...expectedNode3Keys].sort();

      ring.add('node1');
      ring.add('node2');
      ring.add('node3');
      expect(ring.length).toBe(60);
      expect(ring.keys).toEqual(expected);
      expect(ring.nodes).toEqual(['node1', 'node2', 'node3']);
    });
  });

  describe('#remove', () => {
    it('do nothing for missing node', () => {
      const ring = new HashRing();

      ring.add('node1');
      ring.add('node2');
      expect(ring.length).toBe(40);
      expect(ring.keys.length).toBe(40);
      expect(ring.nodes.length).toBe(2);

      ring.remove('unknown');
      expect(ring.length).toBe(40);
      expect(ring.keys.length).toBe(40);
      expect(ring.nodes).toEqual(['node1', 'node2']);
    });

    it('removes node, vnodes and keys', () => {
      const ring = new HashRing();

      ring.add('node1');
      ring.add('node2');
      expect(ring.length).toBe(40);
      expect(ring.keys.length).toBe(40);
      expect(ring.nodes.length).toBe(2);

      ring.remove('node2');
      expect(ring.length).toBe(20);
      expect(ring.keys.length).toBe(20);
      expect(ring.nodes).toEqual(['node1']);
      expect(ring.keys).toEqual(expectedNode1Keys);
    });

    it('cleanup everything for empty ring', () => {
      const ring = new HashRing();

      ring.add('node1');
      ring.add('node2');
      expect(ring.length).toBe(40);
      expect(ring.keys.length).toBe(40);
      expect(ring.nodes.length).toBe(2);

      ring.remove('node1');
      ring.remove('node2');
      expect(ring.length).toBe(0);
      expect(ring.keys.length).toBe(0);
      expect(ring.nodes.length).toBe(0);
    });

    it('keeps keys sorted when remove node', () => {
      const ring = new HashRing();

      ring.add('node1');
      ring.add('node2');
      ring.add('node3');
      ring.remove('node2');
      expect(ring.keys).toEqual([...expectedNode1Keys, ...expectedNode3Keys].sort());
    });
  });

  describe('#getNode', () => {
    it('returns null for empty ring', () => {
      const ring = new HashRing();
      expect(ring.getNode('test')).toBe(null);
    });

    it('returns proper node for each target', () => {
      const ring = new HashRing();
      const targets = {
        'A': 'node3', // 7fc56270e7a70fa81a5935b72eacbe29
        'B': 'node3', // 9d5ed678fe57bcca610140957afab571
        'C': 'node1', // 0d61f8370cad1d412f80b84d143e1257
        'D': 'node2', // f623e75af30e62bbd73d6df5b50bb7b5
        'E': 'node2', // 3a3ea00cfc35332cedf6e5e9a32e94da
        'F': 'node3', // 800618943025315f869e4e1f09471012
        'G': 'node1', // dfcf28d0734569a6a693bc8194de62bf
        'H': 'node2', // c1d9f50f86825a1a2302ec2449c17196
        'I': 'node2', // dd7536794b63bf90eccfd37f9b147d7f
        'J': 'node2', // ff44570aca8241914870afbc310cdb85
        'K': 'node3', // a5f3c6a11b03839d46af9fb43c97c188
        'L': 'node3', // d20caec3b48a1eef164cb4ca81ba2587
        'M': 'node1', // 69691c7bdcc3ce6d5d8a1361f22d04ac
        'N': 'node3', // 8d9c307cb7f3c4a32822a51922d1ceaa
        'O': 'node2', // f186217753c37b9b9f958d906208506e
        'P': 'node1', // 44c29edb103a2872f519ad0c9a0fdaaa
        'Q': 'node2', // f09564c9ca56850d4cd6b3319e541aee
        'R': 'node1', // e1e1d3d40573127e9ee0480caf1283d6
        'S': 'node1', // 5dbc98dcc983a70728bd082d1a47546e
        'T': 'node2', // b9ece18c950afbfa6b0fdbfa4ff731d3
        'U': 'node2', // 4c614360da93c0a041b22e537de151eb
        'V': 'node2', // 5206560a306a2e085a437fd258eb57ce
        'W': 'node1', // 61e9c06ea9a85a5088a499df6458d276
        'X': 'node3', // 02129bb861061d1a052c592e2dc6b383
        'Y': 'node2', // 57cec4137b614c87cb4e24a3d003a3e0
        'Z': 'node1', // 21c2e59531c8710156d34a3c30ac81d5
      };

      ring.add('node1');
      ring.add('node2');
      ring.add('node3');
      Object.keys(targets).forEach(target => {
        expect(ring.getNode(target)).toBe(targets[target]);
      });
    });
  });

  describe('#getNodePosition', () => {
    it('returns vnode when target hash equals to vnode hash', () => {
      const ring = new HashRing();

      ring.add('node1');
      expect(ring.keys[1]).toBe('0d2aa67997848cc7c4b9513513f08c8e');
      expect(ring.getNodePosition('0d2aa67997848cc7c4b9513513f08c8e')).toBe(1);
    });

    it('returns closest vnode when target hash is in hash ring', () => {
      const ring = new HashRing();

      ring.add('node1');
      expect(ring.keys[0]).toBe('01de2a76a32c70a6c3afe5686bc21409');
      expect(ring.keys[1]).toBe('0d2aa67997848cc7c4b9513513f08c8e');
      expect(ring.getNodePosition('01ff0000000000000000000000000000')).toBe(0);
    });

    it('returns latest vnode when target hash < first vnode hash', () => {
      const ring = new HashRing();

      ring.add('node1');
      expect(ring.keys[0]).toBe('01de2a76a32c70a6c3afe5686bc21409');
      expect(ring.getNodePosition('00000000000000000000000000000000')).toBe(19);
    });

    it('returns latest vnode when target hash > latest vnode hash', () => {
      const ring = new HashRing();

      ring.add('node1');
      expect(ring.keys[19]).toBe('ff5b72562a6feab5fc0c33a03372b1b7');
      expect(ring.getNodePosition('ffffffffffffffffffffffffffffffff')).toBe(19);
    });
  });
});
