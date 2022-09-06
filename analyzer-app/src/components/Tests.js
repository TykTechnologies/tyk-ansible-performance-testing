import React from 'react'
import ToggleButton from '@mui/material/ToggleButton'
import ToggleButtonGroup from '@mui/material/ToggleButtonGroup'
import { styled, createTheme, ThemeProvider } from '@mui/material/styles'

import { colors } from '../helpers'

const theme = createTheme({
  palette: {
    primary: {
      main: colors[2],
    }
  },
})

const StyledToggleButtonGroup = styled(ToggleButtonGroup)(({ theme }) => ({
  '&': {
    borderRadius: 10,
    '.MuiToggleButtonGroup-grouped': {
      fontFamily: "'Open Sans', sans-serif",
      fontWeight: 'bold',
      color: '#A8A8CF',
      '&:first-of-type': {
        borderRadius: '10px 10px 0 0',
      },
      '&:last-of-type': {
        borderRadius: '0 0 10px 10px',
      },
      '&.Mui-selected': {
        color: '#C5425C',
        backgroundColor: '#FFE7EA',
      },
    },
  },
}))

export default ({ tests, labels, test, setTest }) => (
  <ThemeProvider theme={theme}>
    <StyledToggleButtonGroup
      value={test}
      onChange={setTest}
      color="primary"
      orientation="vertical"
      exclusive
    >
    {Object.entries(tests).map(([key, value]) => (
      <ToggleButton key={key} value={value}>{labels[key]}</ToggleButton>
    ))}
    </StyledToggleButtonGroup>
  </ThemeProvider>
)
