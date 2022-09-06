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
  getTestsLabels,
  machines,
  getMachineWeight,
  ranges,
} from '../helpers'

const TESTS = [ ...getPerfTests(KONG), ...getPerfTests() ],
      LABELS = [ ...getTestsLabels(KONG), ...getPerfTests() ]

const getTests = cloud => {
  const tests = []

  Object.values(machines).map(value => tests.push(value[clouds.indexOf(cloud)]))

  return tests
}

const getData = (rps, p99, machine) => {
  const data = {}

  data[RPS] = {}
  data[P99] = {}


  Object.keys(rps).forEach(key => {
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
        machine = machines[test][clouds.indexOf(cloud)],
        data = getData(rps[cloud], p99[cloud], machine)

  return (
    <Container maxWidth="lg">
      <div
        style={{
          display: 'flex',
          justifyContent: 'space-between',
          alignItems: 'center',
          fontFamily: "'Open Sans', sans-serif",
          marginBottom: '20px',
        }}
      >
        <div style={{
          display: 'flex',
          flexDirection: 'column',
          minWidth: '160px',
        }}>
          <Clouds
            cloud={cloud}
            setCloud={e => setCloud(e.target.value)}
          />
          <div style={{ height: '10px' }}/>
          <Tests
            test={machines[test][cloud_index]}
            tests={getTests(cloud)}
            labels={getTestsLabels()}
            setTest={e => setTest(getMachineWeight(e.target.value))}
          />
        </div>
        <div>
          <Legend values={LABELS} />
          <div className="bar" style={{ display: "flex" }}>
            <TestsBarChart
              test={RPS}
              tests={TESTS}
              data={[ data.rps ]}
              range={ranges[test][0]}
              machine={machine}
            />
            <TestsBarChart
              test={P99}
              tests={TESTS}
              data={[ data.p99 ]}
              range={ranges[test][1]}
              machine={machine}
            />
          </div>
        </div>
      </div>
      <PluginTable
        labels={LABELS}
        { ...data }
      />
    </Container>
  )
}
