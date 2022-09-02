import React from 'react'
import Table from '@mui/material/Table'
import TableBody from '@mui/material/TableBody'
import TableCell, { tableCellClasses } from '@mui/material/TableCell'
import TableContainer from '@mui/material/TableContainer'
import TableHead from '@mui/material/TableHead'
import TableRow from '@mui/material/TableRow'
import Paper from '@mui/material/Paper'
import { styled } from "@mui/material/styles";

const DECIMAL_PLACES = 2

const MainStyledTableCell = styled(TableCell)(({ theme }) => ({
  [`&.${tableCellClasses.head}`]: {
    backgroundColor: '#04cdb0',
    color: theme.palette.common.white
  },
  [`&.${tableCellClasses.body}`]: {
    fontSize: 14
  }
}));

const StyledTableCell = styled(TableCell)(({ theme }) => ({
  [`&.${tableCellClasses.head}`]: {
    backgroundColor: '#a3a2cd',
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

export default ({ rps, p99, test, cloud, testSet }) => {
  rps = Object.values(rps[cloud][test]).sort((a, b) => a.weight > b.weight ? 1 : -1)
  p99 = Object.values(p99[cloud][test]).sort((a, b) => a.weight > b.weight ? 1 : -1)

  return (
    <TableContainer component={Paper}>
      <Table sx={{ minWidth: 700 }} aria-label="customized table">
          <TableHead>
            <TableRow>
              <MainStyledTableCell></MainStyledTableCell>
              {Object.values(rps).map(({ machine }) => (
                <MainStyledTableCell
                  key={machine}
                  align="right"
                >
                  <strong>{machine}</strong>
                </MainStyledTableCell>
              ))}
            </TableRow>
          </TableHead>
          <TableHead>
            <TableRow>
              <StyledTableCell align="center" colSpan={5}>RPS</StyledTableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            <StyledTableRow sx={{ '&:last-child td, &:last-child th': { border: 0 } }} >
              <TableCell component="th" scope="row"><strong>Tyk</strong></TableCell>
              {rps.map(({ machine, tyk }) => (
                <TableCell
                  key={machine}
                  align="right"
                >
                  {tyk.toFixed(DECIMAL_PLACES)}
                </TableCell>
              ))}
            </StyledTableRow>
            <StyledTableRow sx={{ '&:last-child td, &:last-child th': { border: 0 } }} >
              <TableCell component="th" scope="row"><strong>{testSet[0].toUpperCase() + testSet.slice(1)}</strong></TableCell>
              {rps.map(props => (
                <TableCell
                  key={props.machine}
                  align="right"
                >
                  {props[testSet].toFixed(DECIMAL_PLACES)}
                </TableCell>
              ))}
            </StyledTableRow>
          </TableBody>
          <TableHead>
            <TableRow>
              <StyledTableCell align="center" colSpan={5}>P99</StyledTableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            <StyledTableRow sx={{ '&:last-child td, &:last-child th': { border: 0 } }} >
              <TableCell component="th" scope="row"><strong>Tyk</strong></TableCell>
              {p99.map(({ machine, tyk }) => (
                <TableCell
                  key={machine}
                  align="right"
                >
                  {tyk.toFixed(DECIMAL_PLACES)}
                </TableCell>
              ))}
            </StyledTableRow>
            <StyledTableRow sx={{ '&:last-child td, &:last-child th': { border: 0 } }} >
              <TableCell component="th" scope="row"><strong>{testSet[0].toUpperCase() + testSet.slice(1)}</strong></TableCell>
              {p99.map(props => (
                <TableCell
                  key={props.machine}
                  align="right"
                >
                  {props[testSet].toFixed(DECIMAL_PLACES)}
                </TableCell>
              ))}
            </StyledTableRow>
          </TableBody>
        </Table>
      </TableContainer>
    )
}
