const getTests = vendor => KONG === vendor ? [ 'vanilla','auth','rate-limiting','auth-quota' ] : APOLLO === vendor ? [ 'stitch-0','stitch-1','stitch-2' ] : [ 'all','analytics' ]
const getTestsLabels = vendor => KONG === vendor ? [ 'Vanilla','Auth','Rate-Limiting','Auth & Quota' ] : APOLLO === vendor ? [ 'Query Depth 1','Query Depth 2','Query Depth 3' ] : [ '2 Cores','4 Cores','8 Cores', '16 Cores' ]

const getTest = name => {
  // have to test auth-quota before auth
  const tests = [
    'auth-quota','vanilla','auth','rate-limiting',
    ...getTests(APOLLO),
    ...getTests()
  ]

  for (let i = 0; i < tests.length; ++i) {
    if (name.includes(tests[i])) return tests[i]
  }
}

const machines = {
  2: [ 't2.medium','e2-medium','Standard_B2s' ],
  4: [ 'c5.xlarge','c2-standard-4','Standard_F4s_v2' ],
  8: [ 'c5.2xlarge','c2-standard-8','Standard_F8s_v2' ],
  16: [ 'c5.4xlarge','c2-standard-16','Standard_F16s_v2' ],
}

const getMachineWeight = machine => {
  if (machines[2].includes(machine)) {
    return 2
  } else if (machines[4].includes(machine)) {
    return 4
  } else if (machines[8].includes(machine)) {
    return 8
  } else if (machines[16].includes(machine)) {
    return 16
  }
}

const capitalize = word => word[0].toUpperCase() + word.slice(1)

const clouds = ['aws', 'gcp', 'azure'],
      tests = ['rps', 'p99']

const RPS = 'rps',
      P99 = 'p99'

const KONG = 'kong',
      APOLLO = 'apollo'

const LINE = 'line',
      BAR = 'bar'

const colors = [ "#00CDB0", "#505071", "#FF7787", "#DBA72C", "#A8A8CF", "#C5425C" ]

const ranges = {
  2: [ [0,15000], [0,150] ],
  4: [ [0,25000], [0,15] ],
  8: [ [0,50000], [0,10] ],
  16: [ [0,100000], [0,3] ],
}

export {
  getTest,
  getTests,
  getTestsLabels,
  machines,
  getMachineWeight,
  clouds,
  tests,
  RPS,
  P99,
  KONG,
  APOLLO,
  LINE,
  BAR,
  colors,
  capitalize,
  ranges,
}
