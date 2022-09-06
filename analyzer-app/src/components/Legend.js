import React from 'react'

import {
  colors as c,
  capitalize,
} from '../helpers'

export default ({ values, colors = c }) => (
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
      <div style={{
        fontFamily: "'Open Sans', sans-serif",
        color: '#505071',
      }}>
        {capitalize(value)}
      </div>
    </li>
  ))}
  </ul>
)
