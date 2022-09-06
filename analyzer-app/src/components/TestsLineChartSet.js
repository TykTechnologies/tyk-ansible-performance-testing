import React, { useState } from 'react'
import Container from '@mui/material/Container';

import Clouds from './Clouds'
import Tests from './Tests'
import TestsLineChart from './TestsLineChart'
import Legend from './Legend'
import Table from './Table'

import {
  getTests,
  getTestsLabels,
  clouds,
  APOLLO,
  RPS,
  P99,
  colors,
} from '../helpers'

export default ({ defaultTest, testSet, rps, p99 }) => {
  const [test, setTest] = useState(defaultTest),
        [cloud, setCloud] = useState(clouds[0])

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
            test={test}
            tests={getTests(testSet)}
            labels={getTestsLabels(testSet)}
            setTest={e => setTest(e.target.value)}
          />
        </div>
        <div>
          <Legend
            values={[ 'Tyk', testSet ]}
            colors={APOLLO === testSet ? [ colors[0], colors[2] ] : undefined}
          />
          <div className="line" style={{ display: "flex" }}>
            <TestsLineChart
              test={RPS}
              cloud={clouds.indexOf(cloud)}
              data={Object.values(rps[cloud][test]).sort((a, b) => a.weight > b.weight ? 1 : -1)}
              testSet={testSet}
            />
            <TestsLineChart
              test={P99}
              cloud={clouds.indexOf(cloud)}
              data={Object.values(p99[cloud][test]).sort((a, b) => a.weight > b.weight ? 1 : -1)}
              testSet={testSet}
            />
          </div>
        </div>
      </div>
      <Table
        rps={rps}
        p99={p99}
        test={test}
        cloud={cloud}
        testSet={testSet}
      />
    </Container>
  )
}
