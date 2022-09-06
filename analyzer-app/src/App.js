import React from 'react'

import TestsLineChartSet from './components/TestsLineChartSet'
import TestsBarChartSet from './components/TestsBarChartSet'

import {
  KONG,
  APOLLO,
} from './helpers'

import benchmarks from './benchmarks'

export default class App extends React.Component {
  constructor(props) {
    super(props)
    this.state = {
      cloud: 'aws',
      test: 'auth',
    }
  }

  render() {
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
