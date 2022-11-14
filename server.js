const express = require('express');
const dotenv = require('dotenv');

dotenv.config({path: '.env-local'});

const PORT = process.env.PORT || '3001';

const app = express();
const cors = require('cors');


/**
 * Middleware
 */
app.use(express.json());
// app.use(express.urlencoded({extended:false}));
app.use(cors());
/**
 * Routes
 */

 app.get('/', (request, response) => {
    response.status(200).send("This is not why you're here. Head to /user/:id and replace :id with your user id")
})

const airportRouter = require('./routes/airport');
app.use('/airport',airportRouter);

const airlineRouter = require('./routes/airline');
app.use('/airline',airlineRouter);

const queriesRouter = require('./routes/queries');
app.use('/queries',queriesRouter);

app.listen(PORT, () => {
    console.log(`Listening for requests on port ${PORT}`) 
})