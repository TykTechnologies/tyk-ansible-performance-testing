import React from 'react'
import ToggleButton from '@mui/material/ToggleButton'
import ToggleButtonGroup from '@mui/material/ToggleButtonGroup'
import { createTheme, ThemeProvider } from '@mui/material/styles'

import { rgb } from '../helpers'

const theme = createTheme({
  palette: {
    primary: {
      main: rgb[2],
    }
  },
})


export default ({ tests, test, setTest }) => (
  <ThemeProvider theme={theme}>
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
  </ThemeProvider>
)
