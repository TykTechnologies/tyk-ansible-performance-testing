import React from 'react'

import * as benchmarks from './benchmarks'

const rps_reg = /Requests\/sec:\t(\d+.\d+)/i
const p99_reg = /99% in (\d+.\d+)/i
const name_reg = /bench-([a-zA-Z0-9\.\-\_]+)-(aws|azure|gcp)-(\d)-(.*)/

const getBenchmark = async benchmark => {
  let response = await fetch(benchmark)
  return await response.text()
}

const getVendor = name => name.includes('tyk') ? 'tyk' : name.includes('kong') ? 'kong' : 'apollo'

const getTest = name => {
  if (name.includes('all')) {
    return 'all'
  } else if (name.includes('analytics')) {
    return 'analytics'
  } else if (name.includes('auth-quota')) {
    return 'auth-quota'
  } else if (name.includes('auth')) {
    return 'auth'
  } else if (name.includes('vanilla')) {
    return 'vanilla'
  } else if (name.includes('rate-limiting')) {
    return 'rate-limiting'
  } else if (name.includes('stitch-0')) {
    return 'stitch-0'
  } else if (name.includes('stitch-1')) {
    return 'stitch-1'
  } else if (name.includes('stitch-2')) {
    return 'stitch-2'
  }
}

const test_types = ['rps', 'p99']
const clouds = ['aws', 'gcp', 'azure']
const vendors = ['tyk', 'kong', 'apollo']
const results = {}

for (let i = 0; i < test_types.length; ++i) {
  if (! results[test_types[i]]) results[test_types[i]] = {}
  for (let j = 0; j < clouds.length; ++j) {
    if (! results[test_types[i]][clouds[j]]) results[test_types[i]][clouds[j]] = {}
    for (let k = 0; k < vendors.length; ++k) {
      if (! results[test_types[i]][clouds[j]][vendors[k]]) switch(clouds[j]) {
        case 'aws':
          results[test_types[i]][clouds[j]][vendors[k]] = {
            't2.medium': {},
            'c5.xlarge': {},
            'c5.2xlarge': {},
            'c5.4xlarge': {},
          }
          break;
        case 'gcp':
          results[test_types[i]][clouds[j]][vendors[k]] = {
            'e2-medium': {},
            'c2-standard-4': {},
            'c2-standard-8': {},
            'c2-standard-16': {},
          }
          break;
        case 'azure':
          results[test_types[i]][clouds[j]][vendors[k]] = {
            'Standard_B2s': {},
            'Standard_F4s_v2': {},
            'Standard_F8s_v2': {},
            'Standard_F16s_v2': {},
          }
          break;
      }
    }
  }
}

Object.entries(benchmarks).map(async ([key, value]) => {
  const text = await getBenchmark(value),
        params = key.match(name_reg)

  let cloud   = params[2],
      vendor  = getVendor(params[4]),
      machine = params[1],
      test    = getTest(params[4])

  if (! results['rps'][cloud][vendor][machine][test]) {
    results['rps'][cloud][vendor][machine][test] = []
    results['p99'][cloud][vendor][machine][test] =[]
  }

  results['rps'][cloud][vendor][machine][test].push(text.match(rps_reg)[1])
  results['p99'][cloud][vendor][machine][test].push(text.match(p99_reg)[1])
})

export default () => {
  console.log(results)
  return (
    <div>
      Test
    </div>
  )
}
