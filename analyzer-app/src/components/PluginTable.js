import React from 'react'
import Table from '@mui/material/Table'
import TableBody from '@mui/material/TableBody'
import TableCell, { tableCellClasses } from '@mui/material/TableCell'
import TableContainer from '@mui/material/TableContainer'
import TableHead from '@mui/material/TableHead'
import TableRow from '@mui/material/TableRow'
import Paper from '@mui/material/Paper'
import { styled } from '@mui/material/styles'

import { capitalize } from '../helpers'

const DECIMAL_PLACES = 2

const MainStyledTableCell = styled(TableCell)(({ theme }) => ({
  [`&.${tableCellClasses.head}`]: {
    fontFamily: 'Smoolthan',
    fontWeight: 'bold',
    backgroundColor: '#2CA597',
    color: '#FFFFFF'
  },
  [`&.${tableCellClasses.body}`]: {
    fontSize: 14,
  }
}))

const StyledTableRow = styled(TableRow)(({ theme }) => ({
  '&:nth-of-type(odd)': {
    backgroundColor: "rgba(168, 168, 207, 0.1)"
  },
}));

export default ({ rps, p99, labels }) => (
  <TableContainer
    component={Paper}
    sx={{ borderRadius: '10px' }}
  >
    <Table sx={{ minWidth: 700 }} aria-label="customized table">
      <TableHead>
        <TableRow>
          <MainStyledTableCell align="center"></MainStyledTableCell>
          <MainStyledTableCell align="center">RPS</MainStyledTableCell>
          <MainStyledTableCell align="center">P99 (ms)</MainStyledTableCell>
        </TableRow>
      </TableHead>
      <TableBody>
        {Object.keys(rps).map((key, i) => (
        <StyledTableRow key={key} >
          <TableCell
            component="th"
            scope="row"
            sx={{
              fontFamily: "'Open Sans', sans-serif",
              fontWeight: 'bold',
              color: '#505071',
            }}
          >
            {capitalize(labels[i])}
          </TableCell>
          <TableCell
            component="th"
            scope="row"
            align="center"
            sx={{
              fontFamily: "'Open Sans', sans-serif",
              color: '#505071',
            }}
          >
            {rps[key]?.toFixed(DECIMAL_PLACES)}
          </TableCell>
          <TableCell
            component="th"
            scope="row"
            align="center"
            sx={{
              fontFamily: "'Open Sans', sans-serif",
              color: '#505071',
            }}
          >
            {p99[key]?.toFixed(DECIMAL_PLACES)}
          </TableCell>
        </StyledTableRow>
        ))}
      </TableBody>
    </Table>
  </TableContainer>
)
