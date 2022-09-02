const rps_reg = /Requests\/sec:\t(\d+.\d+)/i
const p99_reg = /99% in (\d+.\d+)/i
const name_reg = /bench-([a-zA-Z0-9.\-_]+)-(aws|azure|gcp)-(\d)-(.*)/

const getBenchmark = async benchmark => {
  let response = await fetch(benchmark)
  return await response.text()
}

const getVendor = name => name.includes('tyk') ? 'tyk' : name.includes(KONG) ? KONG : APOLLO

const getTests = vendor => KONG === vendor ? [ 'vanilla','auth','rate-limiting','auth-quota' ] : APOLLO === vendor ? [ 'stitch-0','stitch-1','stitch-2' ] : [ 'all','analytics' ]

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
  16: [ 'c5.4xlarge','c2-standard-16','Standard_F16s_v2' ]
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

const getRecord = (machine, test) => {
  const record = {
    machine,
    weight: getMachineWeight(machine),
    tyk: 0,
  }

  if (test.includes('stitch')) record[APOLLO] = 0
  else if (['vanilla', 'auth', 'rate-limiting', 'auth-quota'].includes(test)) record[KONG] = 0

  return record
}

const clouds = ['aws', 'gcp', 'azure']
const tests = ['rps', 'p99']

const RPS = 'rps',
      P99 = 'p99'

const KONG = 'kong',
      APOLLO = 'apollo'

export {
  rps_reg,
  p99_reg,
  name_reg,
  getBenchmark,
  getVendor,
  getTest,
  getTests,
  machines,
  getMachineWeight,
  getRecord,
  clouds,
  tests,
  RPS,
  P99,
  KONG,
  APOLLO,
}
