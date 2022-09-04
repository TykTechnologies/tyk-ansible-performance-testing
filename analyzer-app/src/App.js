import React from 'react'
import CircularProgress from '@mui/material/CircularProgress'
import Box from '@mui/material/Box'

import TestsLineChartSet from './components/TestsLineChartSet'
import TestsBarChartSet from './components/TestsBarChartSet'

import {
  rps_reg,
  p99_reg,
  name_reg,
  getBenchmark,
  getVendor,
  getTest,
  getRecord,
  clouds,
  tests,
  RPS,
  P99,
  KONG,
  APOLLO,
} from './helpers'

import * as benchmarks from './benchmarks'

export default class App extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      benchmarks: false,
      cloud: 'aws',
      test: 'auth',
    }
  }

  componentDidMount() {
    const results = {}

    results[RPS] = {}
    results[P99] = {}

    for (let i = 0; i < tests.length; ++i) {
      for (let j = 0; j < clouds.length; ++j) {
        if (! results[tests[i]][clouds[j]]) results[tests[i]][clouds[j]] = {}
      }
    }

    Object.entries(benchmarks).map(async ([key, value]) => {
      const text    = await getBenchmark(value),
            params  = key.match(name_reg),
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

      this.setState({ benchmarks: results })
    })
  }

  render() {
    const { cloud, benchmarks, test } = this.state

    if (!(benchmarks?.rps?.[cloud]?.[test])) return (
      <Box sx={{
        display: 'flex',
        justifyContent: 'center',
        alignItems: 'center',
        width: '100vw',
        height: '100vh',
      }}>
        <CircularProgress />
      </Box>
    )

    return (
      <div>
      {this.props.tyk ? <TestsBarChartSet
        defaultTest={16}
        { ...benchmarks }
      /> : null}
      {this.props.kong ? <TestsLineChartSet
        testSet={KONG}
        defaultTest={'auth'}
        { ...benchmarks }
      /> : null}
      {this.props.apollo ? <TestsLineChartSet
        testSet={APOLLO}
        defaultTest={'stitch-0'}
        { ...benchmarks }
      /> : null}
      </div>
    )
  }
}
