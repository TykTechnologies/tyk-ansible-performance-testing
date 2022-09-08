import React from 'react'
import ToggleButton from '@mui/material/ToggleButton'
import ToggleButtonGroup from '@mui/material/ToggleButtonGroup'
import { styled, createTheme, ThemeProvider } from '@mui/material/styles'

import { colors } from '../helpers'

const theme = createTheme({
  palette: {
    primary: {
      main: colors[0],
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
        color: '#258C80',
        backgroundColor: '#D7F8F3',
        borderTop: '1px solid rgba(0, 0, 0, 0.12)',
      },
    },
  },
}))

export default ({ cloud, setCloud }) => (
  <ThemeProvider theme={theme}>
    <StyledToggleButtonGroup
      value={cloud}
      onChange={setCloud}
      color="primary"
      orientation="vertical"
      exclusive
    >
      <ToggleButton value="aws">AWS</ToggleButton>
      <ToggleButton value="gcp">GCP</ToggleButton>
      <ToggleButton value="azure">Azure</ToggleButton>
    </StyledToggleButtonGroup>
  </ThemeProvider>
)
