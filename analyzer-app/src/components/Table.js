import React, { Fragment } from 'react'
import Table from '@mui/material/Table'
import TableBody from '@mui/material/TableBody'
import TableCell, { tableCellClasses } from '@mui/material/TableCell'
import TableContainer from '@mui/material/TableContainer'
import TableHead from '@mui/material/TableHead'
import TableRow from '@mui/material/TableRow'
import Paper from '@mui/material/Paper'
import { styled } from "@mui/material/styles";

import {
  capitalize,
  DECIMAL_PLACES,
} from '../helpers'

const MainStyledTableCell = styled(TableCell)(({ theme }) => ({
  [`&.${tableCellClasses.head}`]: {
    fontFamily: 'Smoolthan',
    fontWeight: 'bold',
    fontSize: '16px',
    backgroundColor: '#2CA597',
    color: '#FFFFFF'
  },
  [`&.${tableCellClasses.body}`]: {
    fontSize: 14
  }
}));

const StyledTableCell = styled(TableCell)(({ theme }) => ({
  [`&.${tableCellClasses.head}`]: {
    fontFamily: "'Open Sans', sans-serif",
    fontWeight: 'bold',
    backgroundColor: '#D7F8F3',
    color: '#258C80',
    padding: 4
  },
  [`&.${tableCellClasses.body}`]: {
    fontSize: 14
  }
}));

const StyledTableRow = styled(TableRow)(({ theme }) => ({
  "&:nth-of-type(odd)": {
    backgroundColor: "rgba(168, 168, 207, 0.1)"
  },
}));

export default ({ rps, p99, test, cloud, testSet }) => {
  rps = Object.values(rps[cloud][test]).sort((a, b) => a.weight > b.weight ? 1 : -1)
  p99 = Object.values(p99[cloud][test]).sort((a, b) => a.weight > b.weight ? 1 : -1)

  return (
    <TableContainer
      component={Paper}
      sx={{ borderRadius: '10px' }}
    >
      <Table sx={{ minWidth: 700 }} aria-label="customized table">
        <TableHead>
          <TableRow>
            <MainStyledTableCell></MainStyledTableCell>
            {Object.values(rps).map(({ machine }) => (
              <MainStyledTableCell
                key={machine}
                align="center"
              >
                <strong>{machine}</strong>
              </MainStyledTableCell>
            ))}
          </TableRow>
        </TableHead>
        {[ { name: 'RPS', value: rps }, { name: 'P99', value: p99 } ].map(({ name, value }, i) => (
        <Fragment key={i}>
          <TableHead>
            <TableRow>
              <StyledTableCell align="center" colSpan={5}>{name}</StyledTableCell>
            </TableRow>
          </TableHead>
          <TableBody>
            {[ 'tyk', testSet ].map((test, i) => (
            <StyledTableRow key={i}>
              <TableCell
                component="th"
                scope="row"
                sx={{
                  fontFamily: "'Open Sans', sans-serif",
                  fontWeight: 'bold',
                  color: '#505071',
                }}
              >
                {capitalize(test)}
              </TableCell>
              {value.map(props => (
                <TableCell
                  key={props.machine}
                  align="center"
                  sx={{
                    fontFamily: "'Open Sans', sans-serif",
                    color: '#505071',
                  }}
                >
                  {props[test].toFixed(DECIMAL_PLACES)}
                </TableCell>
              ))}
            </StyledTableRow>
            ))}
          </TableBody>
        </Fragment>
        ))}
      </Table>
    </TableContainer>
  )
}
