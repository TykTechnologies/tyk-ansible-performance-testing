import React, { useState } from 'react'

import Clouds from './Clouds'
import Tests from './Tests'
import TestsLineChart from './TestsLineChart'
import Legend from './Legend'
import Table from './Table'

import {
  getTests,
  clouds,
  RPS,
  P99,
} from '../helpers'

export default ({ defaultTest, testSet, rps, p99 }) => {
  const [test, setTest] = useState(defaultTest),
        [cloud, setCloud] = useState(clouds[0])

  return (
    <div
      style={{
        display: 'flex',
        fontFamily: '"Roboto","Helvetica","Arial",sans-serif',
        marginBottom: '20px',
      }}
    >
      <Tests
        test={test}
        tests={getTests(testSet)}
        setTest={e => setTest(e.target.value)}
      />
      <div>
        <Clouds
          cloud={cloud}
          setCloud={e => setCloud(e.target.value)}
        />
        <div>
          <Legend testSet={testSet}/>
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
          <Table
            rps={rps}
            p99={p99}
            test={test}
            cloud={cloud}
            testSet={testSet}
          />
        </div>
      </div>
    </div>
  )
}
