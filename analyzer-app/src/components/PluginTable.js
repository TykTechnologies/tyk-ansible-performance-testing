import React from 'react'
import Table from '@mui/material/Table'
import TableBody from '@mui/material/TableBody'
import TableCell, { tableCellClasses } from '@mui/material/TableCell'
import TableContainer from '@mui/material/TableContainer'
import TableHead from '@mui/material/TableHead'
import TableRow from '@mui/material/TableRow'
import Paper from '@mui/material/Paper'
import { styled } from '@mui/material/styles'

import {
  rgb,
  capitalize,
} from '../helpers'

const DECIMAL_PLACES = 2

const MainStyledTableCell = styled(TableCell)(({ theme }) => ({
  [`&.${tableCellClasses.head}`]: {
    backgroundColor: rgb[0],
    color: theme.palette.common.white
  },
  [`&.${tableCellClasses.body}`]: {
    fontSize: 14
  }
}));

const StyledTableRow = styled(TableRow)(({ theme }) => ({
  "&:nth-of-type(odd)": {
    backgroundColor: theme.palette.action.hover
  },
  // hide last border
  "&:last-child td, &:last-child th": {
    border: 0
  }
}));

export default ({ rps, p99 }) => {
  return (
    <TableContainer component={Paper}>
      <Table sx={{ minWidth: 700 }} aria-label="customized table">
          <TableHead>
            <TableRow>
              <MainStyledTableCell></MainStyledTableCell>
              <MainStyledTableCell>RPS</MainStyledTableCell>
              <MainStyledTableCell>P99 (ms)</MainStyledTableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {Object.keys(rps).map(key => (
            <StyledTableRow key={key} sx={{ '&:last-child td, &:last-child th': { border: 0 } }} >
              <TableCell component="th" scope="row"><strong>{key.split('-').map( v => capitalize(v)).join(' & ')}</strong></TableCell>
              <TableCell component="th" scope="row">{rps[key]?.toFixed(DECIMAL_PLACES)}</TableCell>
              <TableCell component="th" scope="row">{p99[key]?.toFixed(DECIMAL_PLACES)}</TableCell>
            </StyledTableRow>
            ))}
          </TableBody>
        </Table>
      </TableContainer>
    )
}
