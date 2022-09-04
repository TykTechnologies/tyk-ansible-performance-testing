import React from 'react'
import {
  LineChart,
  Line,
  CartesianGrid,
  ResponsiveContainer,
  XAxis,
  YAxis,
  ReferenceArea,
} from 'recharts';

import {
  KONG,
  P99,
  rgba,
} from '../helpers'

import './TestLineChart.css'

const CustomizedTick = ({ payload, verticalAnchor, index, visibleTicksCount, tickFormatter, ...props }) => (
  <text
    { ...props}
    className="recharts-text recharts-cartesian-axis-tick-value"
  >
    <tspan
      x={props.x}
      dy="0.71em"
      style={{
        fontWeight: [ 2, 4, 8, 16 ].includes(payload.value) ? 'bolder' : 'lighter'
      }}
    >
      {payload.value}
    </tspan>
  </text>
)

const CustomShape = props => (
  <g>
    <rect
      { ...props }
      // fill='red'
      fillOpacity={0.1}
    />
  </g>
)

export default ({ test, data, cloud, testSet }) => (
  <ResponsiveContainer width={500} height="100%">
    <LineChart
      data={data}
      margin={{ top: 40, right: 40, left: 40, bottom: 40 }}
    >
      <CartesianGrid
        strokeDasharray="5"
        vertical={false}
      />
      <XAxis
        dataKey="weight"
        axisLine={{ strokeWidth: 2 }}
        tickLine={{ strokeWidth: 2 }}
        type="number"
        domain={[0, 18]}
        interval="preserveStart"
        ticks={[ 2, 4, 6, 8, 10, 12, 14, 16 ]}
        tick={<CustomizedTick />}
        label={{ value: 'CPUs', offset: -20, position: 'insideBottom' }}
      />
      <YAxis
        axisLine={false}
        tickLine={false}
        type="number"
        label={{
          value: `${test.toUpperCase()}${P99 === test ? '(ms)' : ''}`,
          angle: -90,
          offset: -20,
          position: 'insideLeft'
        }}
      />
      {Object.entries([ 2, 6, 10, 14 ]).map(([key, value]) => (
      <ReferenceArea
        key={key}
        x1={value}
        x2={value+2}
        shape={<CustomShape />}
      />
      ))}
      <Line
        type="linear"
        dataKey="tyk"
        stroke={rgba[0]}
        strokeWidth="4"
        dot={{ strokeWidth: 2 }}
        activeDot={{ r: 6 }}
      />
      <Line
        type="linear"
        dataKey={testSet}
        stroke={KONG === testSet ? rgba[1] : rgba[2]}
        strokeWidth="4"
        dot={{ strokeWidth: 2 }}
        activeDot={{ r: 6 }}
      />
    </LineChart>
  </ResponsiveContainer>
)
