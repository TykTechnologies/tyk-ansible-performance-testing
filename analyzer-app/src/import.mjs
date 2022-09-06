import fs from 'fs'
import {
  KONG,
  APOLLO,
  RPS,
  P99,
  tests,
  clouds,
  getMachineWeight,
  getTest,
} from './helpers.mjs'

const DIR = '../benchmarks/'

const rps_reg = /Requests\/sec:\t(\d+.\d+)/i
const p99_reg = /99% in (\d+.\d+)/i
const name_reg = /bench-([a-zA-Z0-9.\-_]+)-(aws|azure|gcp)-(\d)-(.*)/

const getVendor = name => name.includes('tyk') ? 'tyk' : name.includes(KONG) ? KONG : APOLLO

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

const results = {}

results[RPS] = {}
results[P99] = {}

for (let i = 0; i < tests.length; ++i) {
  for (let j = 0; j < clouds.length; ++j) {
    if (! results[tests[i]][clouds[j]]) results[tests[i]][clouds[j]] = {}
  }
}

fs.readdir(DIR, (err, files) => {
  files.forEach(file => {
    if (file.includes('.txt')) fs.readFile(DIR + file, "utf8", (err, text) => {
      const params  = file.match(name_reg),
            cloud   = params[2],
            vendor  = getVendor(params[4]),
            machine = params[1],
            test    = getTest(params[4])

      if (! results[RPS][cloud][test]) {
        results[RPS][cloud][test] = {}
        results[P99][cloud][test] = {}
      }


      if (! results[RPS][cloud][test][machine] ) {
        results[RPS][cloud][test][machine] = getRecord(machine, test)
        results[P99][cloud][test][machine] = getRecord(machine, test)
      }

      results[RPS][cloud][test][machine][vendor] += (parseFloat(text.match(rps_reg)[1]) / 3)
      results[P99][cloud][test][machine][vendor] += (parseFloat(text.match(p99_reg)[1] * 1000) / 3)

      fs.writeFileSync('./src/benchmarks.json', JSON.stringify(results))
    })
  })
})
