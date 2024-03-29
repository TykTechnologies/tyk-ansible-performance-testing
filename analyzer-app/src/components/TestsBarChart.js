import React from 'react'
import {
  BarChart,
  Bar,
  CartesianGrid,
  ResponsiveContainer,
  XAxis,
  YAxis,
} from 'recharts';

import {
  P99,
  colors,
} from '../helpers'

import './TestBarChart.css'

export default ({ test, tests, data, range, machine }) => (
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
      <BarChart
        data={data}
        margin={{ top: 10, right: 10, left: 10, bottom: 30 }}
      >
        {Object.values(tests).sort().map((value, key) => (
        <Bar
          key={key}
          dataKey={value}
          fill={colors[key]}
          radius={[10, 10, 0, 0]}
        />
        ))}
        <CartesianGrid
          strokeDasharray="5"
          vertical={false}
        />
        <XAxis
          xAxisId={0}
          tickLine={false}
          axisLine={{ strokeWidth: 2 }}
          tick={false}
          domain={[0]}
          label={{
            value: machine,
            offset: -20,
            position: 'insideBottom',
          }}
        />
        <XAxis
          xAxisId={1}
          axisLine={false}
          tickLine={false}
          tick={false}
          label={{
            value: P99 === test ? "(lower is better)" : "(higher is better)",
            offset: 0,
            position: P99 === test ? "insideRight" : "insideLeft",
          }}
        />
        <YAxis
          axisLine={false}
          tickLine={false}
          domain={range}
          tickCount={6}
        />
      </BarChart>
    </ResponsiveContainer>
  </div>
)
