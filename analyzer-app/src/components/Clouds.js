import React from 'react'
import ToggleButton from '@mui/material/ToggleButton'
import ToggleButtonGroup from '@mui/material/ToggleButtonGroup'
import { createTheme, ThemeProvider } from '@mui/material/styles'

import { rgb } from '../helpers'

const theme = createTheme({
  palette: {
    primary: {
      main: rgb[0],
    }
  },
})

export default ({ cloud, setCloud }) => (
  <ThemeProvider theme={theme}>
    <ToggleButtonGroup
      value={cloud}
      onChange={setCloud}
      color="primary"
      orientation="vertical"
      exclusive
    >
      <ToggleButton value="aws">AWS</ToggleButton>
      <ToggleButton value="gcp">GCP</ToggleButton>
      <ToggleButton value="azure">Azure</ToggleButton>
    </ToggleButtonGroup>
  </ThemeProvider>
)
