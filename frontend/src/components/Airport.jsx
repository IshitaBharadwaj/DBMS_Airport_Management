import React, { useEffect, useState } from 'react';
import Table from '@mui/material/Table';
import TableBody from '@mui/material/TableBody';
import TableCell from '@mui/material/TableCell';
import TableContainer from '@mui/material/TableContainer';
import TableHead from '@mui/material/TableHead';
import TableRow from '@mui/material/TableRow';
import Paper from '@mui/material/Paper';
import axios from 'axios';
// import axios from '../../../axios';
// import {useSelector} from 'react-redux'

export default function Airport() {
    //   const {user} = useSelector((state)=>state.auth)
    const [airporttable, setairporttable] = useState([]);
    useEffect(() => {
        const airportdata = async () => {
            try {
                const response = await axios.get(
                    `http://localhost:3001/airport`
                );
                setairporttable(response.data);
                // console.log(response.data);
            } catch (e) {
                console.log(e);
            }
        };
        airportdata();
    }, []);
    return (
        <div className="mb-5">
            <h1 className="text-5xl flex justify-center">
                Airports
            </h1>
            <TableContainer component={Paper} className="flex justify-center">
                <Table
                    sx={{
                        width: 900,
                        align: 'center',
                        marginTop: 5,
                        border: '1px solid',
                    }}
                    aria-label="simple table"
                    className="flex justify-center">
                    <TableHead>
                        <TableRow>
                            <TableCell>Airport Name</TableCell>
                            <TableCell align="right">City</TableCell>
                            <TableCell align="right">State</TableCell>
                        </TableRow>
                    </TableHead>
                    <TableBody>
                        {airporttable.map((row) => (
                            <TableRow>
                                <TableCell component="th" scope="row">
                                    {row.airport_name}
                                </TableCell>
                                <TableCell align="right">{row.city}</TableCell>
                                <TableCell align="right">
                                    {row.state}
                                </TableCell>
                            </TableRow>
                        ))}
                    </TableBody>
                </Table>
            </TableContainer>
            <div className='mt-10 flex justify-center box-border'>
                <a href="/insertairport"><button class="bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded mx-2">
                    Insert Airport
                </button></a>
                <a href="/deleteairport"><button class="bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded mx-2">
                    Delete Airport
                </button></a>
                <a href="/updateairport"><button class="bg-transparent hover:bg-blue-500 text-blue-700 font-semibold hover:text-white py-2 px-4 border border-blue-500 hover:border-transparent rounded mx-2">
                    Update Airport
                </button></a>
            </div>
        </div>
    );
}