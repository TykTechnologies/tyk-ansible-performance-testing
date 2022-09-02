import React from 'react'
import ToggleButton from '@mui/material/ToggleButton'
import ToggleButtonGroup from '@mui/material/ToggleButtonGroup'

export default ({ tests, test, setTest }) => {
  return (
    <ToggleButtonGroup
      value={test}
      onChange={setTest}
      color="primary"
      orientation="vertical"
      exclusive
    >
    {Object.entries(tests).map(([key, value]) => (
      <ToggleButton key={key} value={value}>{value}</ToggleButton>
    ))}
    </ToggleButtonGroup>
  )
}
