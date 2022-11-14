import './App.css';
import React from 'react';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import Airline from './components/Airline';
import Airport from './components/Airport';
import Home from './components/Home';
import InsertAirport from './components/InsertAirport';
import DeleteAirport from './components/DeleteAirport';
import UpdateAirport from './components/UpdateAirport';

function App() {
  return (
    <div className="App">
      <BrowserRouter>
          <Routes>
            <Route exact path="/" element={<Home />} />
            <Route exact path="/airport" element={<Airport />} />
            <Route exact path="/airline" element={<Airline/>} />
            <Route exact path="/insertairport" element={<InsertAirport/>} />
            <Route exact path="/deleteairport" element={<DeleteAirport/>} />
            <Route exact path="/updateairport" element={<UpdateAirport/>} />

          </Routes>
      </BrowserRouter>
    </div>
  );
}

export default App;
