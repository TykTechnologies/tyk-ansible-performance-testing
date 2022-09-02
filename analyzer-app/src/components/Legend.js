import React from 'react'

import { KONG } from '../helpers'

export default ({ testSet }) => (
  <ul className="recharts-default-legend" style={{ padding: '0px', margin: '0px', textAlign: 'center'}}>
    <li className="recharts-legend-item legend-item-0" style={{ display: 'inline-block', marginRight: '10px' }}>
      <svg className="recharts-surface" width="20" height="20" viewBox="0 0 32 32" version="1.1" style={{ display: 'inline-block', verticalAlign: 'middle', marginRight: '4px'}}>
        <path strokeWidth="4" fill="none" stroke="#04cdb0" d="M0,16h10.666666666666666
          A5.333333333333333,5.333333333333333,0,1,1,21.333333333333332,16
          H32M21.333333333333332,16
          A5.333333333333333,5.333333333333333,0,1,1,10.666666666666666,16" className="recharts-legend-icon">
          </path>
        </svg>
        <span className="recharts-legend-item-text" style={{ color: 'rgb(4, 205, 176)' }}><strong>Tyk</strong></span>
    </li>
    <li className="recharts-legend-item legend-item-1" style={{ display: 'inline-block', marginRight: '10px' }}>
      <svg className="recharts-surface" width="20" height="20" viewBox="0 0 32 32" version="1.1" style={{ display: 'inline-block', verticalAlign: 'middle', marginRight: '4px'}}>
        <path strokeWidth="4" fill="none" stroke={KONG === testSet ? '#a3a2cd' : '#ff7787'} d="M0,16h10.666666666666666
      A5.333333333333333,5.333333333333333,0,1,1,21.333333333333332,16
      H32M21.333333333333332,16
      A5.333333333333333,5.333333333333333,0,1,1,10.666666666666666,16" className="recharts-legend-icon">
        </path>
      </svg>
      <span className="recharts-legend-item-text" style={{ color: KONG === testSet ? '#a3a2cd' : '#ff7787' }}><strong>{testSet[0].toUpperCase()+testSet.slice(1)}</strong></span>
    </li>
  </ul>
)
