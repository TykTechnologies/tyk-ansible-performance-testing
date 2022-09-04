import React, { useState } from 'react'
import Container from '@mui/material/Container';

import Clouds from './Clouds'
import Tests from './Tests'
import TestsBarChart from './TestsBarChart'
import Legend from './Legend'
import PluginTable from './PluginTable'

import {
  clouds,
  RPS,
  P99,
  KONG,
  getTests as getPerfTests,
  machines,
  getMachineWeight,
  ranges,
} from '../helpers'

const TESTS = [ ...getPerfTests(KONG), ...getPerfTests() ]

const getTests = cloud => {
  const tests = []

  Object.values(machines).map(value => tests.push(value[clouds.indexOf(cloud)]))

  return tests
}

const getData = (rps, p99, machine) => {
  const data = {}

  data[RPS] = {}
  data[P99] = {}

  Object.keys(rps).map(key => {
    if (TESTS.includes(key)) {
      data[RPS][key] = rps[key][machine]?.tyk
      data[P99][key] = p99[key][machine]?.tyk
    }
  })

  return data
}

export default ({ defaultTest, rps, p99 }) => {
  const [test, setTest] = useState(defaultTest),
        [cloud, setCloud] = useState(clouds[0]),
        cloud_index=clouds.indexOf(cloud),
        data = getData(rps[cloud], p99[cloud], machines[test][clouds.indexOf(cloud)])

  return (
    <Container maxWidth="lg">
      <div
        style={{
          display: 'flex',
          justifyContent: 'center',
          alignItems: 'center',
          fontFamily: '"Roboto","Helvetica","Arial",sans-serif',
          marginBottom: '20px',
        }}
      >
        <div style={{
          display: 'flex',
          flexDirection: 'column',
          width: '200px',
        }}>
          <Clouds
            cloud={cloud}
            setCloud={e => setCloud(e.target.value)}
          />
          <div style={{ height: '10px' }}/>
          <Tests
            test={machines[test][cloud_index]}
            tests={getTests(cloud)}
            setTest={e => setTest(getMachineWeight(e.target.value))}
          />
        </div>
        <div>
          <Legend values={TESTS} />
          <div style={{ display: "flex" }}>
            <div style={{
              width: '500px',
              height: '400px'
            }}>
              <TestsBarChart
                test={RPS}
                tests={TESTS}
                data={[ data.rps ]}
                range={ranges[test][0]}
              />
            </div>
            <div style={{
              width: '500px',
              height: '400px'
            }}>
              <TestsBarChart
                test={P99}
                tests={TESTS}
                data={[ data.p99 ]}
                range={ranges[test][1]}
              />
            </div>
          </div>
        </div>
      </div>
      <PluginTable
        { ...data }
      />
    </Container>
  )
}
