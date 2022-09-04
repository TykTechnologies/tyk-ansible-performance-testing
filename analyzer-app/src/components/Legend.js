import React from 'react'

import {
  rgb,
  capitalize,
} from '../helpers'

export default ({ values, colors = rgb }) => (
  <ul style={{
    display: 'flex',
    flexWrap: 'wrap',
    justifyContent: 'center'
  }}>
  {values.map((value, i) => (
    <li
      key={i}
      style={{
        padding: '5px',
        listStyle: 'none',
        display: 'flex',
        alignItems: 'center',
      }} >
      <div style={{
        height: '15px',
        width: '15px',
        borderRadius: '15px',
        backgroundColor: colors?.[i],
        margin: '5px',
      }}/>
      <div>{value.split('-').map(v => capitalize(v)).join(' & ')}</div>
    </li>
  ))}
  </ul>
)
