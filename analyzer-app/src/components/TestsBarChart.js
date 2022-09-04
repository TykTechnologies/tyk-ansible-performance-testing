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
  rgba,
} from '../helpers'

export default ({ test, tests, data }) => (
  <ResponsiveContainer width={500} height="100%">
    <BarChart
      data={data}
      margin={{ top: 40, right: 40, left: 40, bottom: 40 }}
    >
      <CartesianGrid
        strokeDasharray="5"
        vertical={false}
      />
      <XAxis
        tickLine={false}
        axisLine={{ strokeWidth: 2 }}
        tick={false}
        domain={[0]}
      />
      <YAxis
        axisLine={false}
        tickLine={false}
        label={{
          value: `${test.toUpperCase()}${P99 === test ? '(ms)' : ''}`,
          angle: -90,
          offset: -20,
          position: 'insideLeft'
        }}
      />
      {Object.values(tests).map((value, key) => (
      <Bar
        key={key}
        dataKey={value}
        fill={rgba[key]}
        radius={[10, 10, 0, 0]}
      />
      ))}
    </BarChart>
  </ResponsiveContainer>
)
