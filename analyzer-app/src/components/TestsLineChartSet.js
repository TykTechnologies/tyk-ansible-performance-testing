import React, { useState } from 'react'
import Container from '@mui/material/Container';

import Clouds from './Clouds'
import Tests from './Tests'
import TestsLineChart from './TestsLineChart'
import Legend from './Legend'
import Table from './Table'

import {
  getTests,
  clouds,
  APOLLO,
  RPS,
  P99,
  rgb,
} from '../helpers'

export default ({ defaultTest, testSet, rps, p99 }) => {
  const [test, setTest] = useState(defaultTest),
        [cloud, setCloud] = useState(clouds[0])

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
            test={test}
            tests={getTests(testSet)}
            setTest={e => setTest(e.target.value)}
          />
        </div>
        <div>
          <Legend
            values={[ 'Tyk', testSet ]}
            colors={APOLLO === testSet ? [ rgb[0], rgb[2] ] : undefined}
          />
          <div style={{ display: "flex" }}>
            <div style={{
              width: '500px',
              height: '400px'
            }}>
              <TestsLineChart
                test={RPS}
                cloud={clouds.indexOf(cloud)}
                data={Object.values(rps[cloud][test]).sort((a, b) => a.weight > b.weight ? 1 : -1)}
                testSet={testSet}
              />
            </div>
            <div style={{
              width: '500px',
              height: '400px'
            }}>
              <TestsLineChart
                test={P99}
                cloud={clouds.indexOf(cloud)}
                data={Object.values(p99[cloud][test]).sort((a, b) => a.weight > b.weight ? 1 : -1)}
                testSet={testSet}
              />
            </div>
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
