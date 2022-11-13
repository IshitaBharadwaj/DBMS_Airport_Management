import './App.css';
import React from 'react';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import Airline from './components/Airline';
import Airport from './components/Airport';
import Home from './components/Home';

function App() {
  return (
    <div className="App">
      <BrowserRouter>
          <Routes>
            <Route exact path="/" element={<Home />} />
            <Route exact path="/airport" element={<Airport />} />
            <Route exact path="/airline" element={<Airline/>} />
          </Routes>
      </BrowserRouter>
    </div>
  );
}

export default App;
