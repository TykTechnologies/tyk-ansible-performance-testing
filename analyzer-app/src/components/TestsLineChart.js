import React from 'react'
import {
  LineChart,
  Line,
  CartesianGrid,
  ResponsiveContainer,
  XAxis,
  YAxis,
  ReferenceArea,
  Tooltip,
} from 'recharts';

import {
  KONG,
  P99,
  colors,
  capitalize,
  DECIMAL_PLACES,
  machines,
} from '../helpers'

import './TestLineChart.css'

const CustomizedTick = ({ payload, verticalAnchor, index, visibleTicksCount, tickFormatter, ...props }) => (
  <text
    { ...props}
    className="recharts-text recharts-cartesian-axis-tick-value"
    fill="#505071"
  >
    <tspan
      x={props.x}
      dy="0.71em"
      style={{
        fontWeight: [ 2, 4, 8, 16 ].includes(payload.value) ? 'bolder' : 'lighter',
        fontFamily: "'Open Sans', sans-serif",
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
      fill='#A8A8CF'
      fillOpacity={0.1}
    />
  </g>
)

export default ({ test, data, cloud, testSet }) => (
  <div style={{
    width: '470px',
    height: '400px',
    display: 'flex',
  }}>
    <div
      className="yAxis"
      style={{
        display: 'flex',
        alignItems: 'center',
        maxWidth: '20px',
        height: '340px',
      }}
    >
      <label
        className="recharts-label"
        style={{ transform: 'rotate(-90deg)' }}
      >
        {`${test.toUpperCase()}${P99 === test ? '(ms)' : ''}`}
      </label>
    </div>
    <ResponsiveContainer width={450} height="100%">
      <LineChart
        data={data}
        margin={{ top: 10, right: 10, left: 10, bottom: 30 }}
      >
        {Object.entries([ 2, 6, 10, 14 ]).map(([key, value]) => (
        <ReferenceArea
          key={key}
          x1={value}
          x2={value+2}
          shape={<CustomShape />}
        />
        ))}
        <Tooltip
          labelFormatter={machine => machines[machine][cloud]}
          formatter={(value, name) => [value.toFixed(DECIMAL_PLACES), capitalize(name)]}
          separator=":"
          cursor={{
            stroke: '#A8A8CF',
            strokeWidth: 1
          }}
        />
        <Line
          type="linear"
          dataKey="tyk"
          stroke={colors[0]}
          strokeWidth="4"
          dot={{ strokeWidth: 2 }}
          activeDot={{ r: 6 }}
        />
        <Line
          type="linear"
          dataKey={testSet}
          stroke={KONG === testSet ? colors[1] : colors[2]}
          strokeWidth="4"
          dot={{ strokeWidth: 2 }}
          activeDot={{ r: 6 }}
        />
        <CartesianGrid
          strokeDasharray="5"
          strokeFill="red"
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
        />
      </LineChart>
    </ResponsiveContainer>
  </div>
)
