import React from 'react'
import ToggleButton from '@mui/material/ToggleButton'
import ToggleButtonGroup from '@mui/material/ToggleButtonGroup'

export default ({ cloud, setCloud }) => {
  return (
    <ToggleButtonGroup
      value={cloud}
      onChange={setCloud}
      color="primary"
      exclusive
    >
      <ToggleButton value="aws">AWS</ToggleButton>
      <ToggleButton value="gcp">GCP</ToggleButton>
      <ToggleButton value="azure">Azure</ToggleButton>
    </ToggleButtonGroup>
  )
}
