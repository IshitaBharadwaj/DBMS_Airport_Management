const express = require('express');
const router = express.Router();
const pool = require('../helpers/database');
// const bcrypt = require('bcrypt');

router.get('/',async function(req,res){
    try {
        const sqlQuery = 'SELECT airport_name, city, state FROM airport';
        const rows = await pool.query(sqlQuery);
        res.status(200).json(rows);
    } catch (error) {
        res.status(400).send(error.message)
    }


    res.status(200).json({name:"Ishita"})
});

router.post('/insert_airport', async function(req,res) {
    try {
        const {airport_name, city,state} = req.body;
        
        const sqlQuery = 'INSERT INTO airport (airport_name, city,state) VALUES (?,?,?)';
        const result = await pool.query(sqlQuery, [airport_name, city,state]);

        res.status(200).json(result);
    } catch (error) {
        res.status(400).send(error.message)
    }
});

router.post('/update', async function(req,res) {
    try {
        const {choice,oldairportname,update_value} = req.body;
        switch(choice){
            case 1:
                airport_name=update_value;
                const sqlGetUser1 = 'update airport set airport_name = ? where airport_name = ?';
                const rows1 = await pool.query(sqlGetUser1,[airport_name,oldairportname]);

                if(rows1){
                    res.status(200).send(`Updated Airport name.`)
                }
                break;
            case 2:
                city=update_value;
                const sqlGetUser2 = 'update airport set city = ? where airport_name = ?';
                const rows2 = await pool.query(sqlGetUser2,[city,oldairportname]);

                if(rows2){
                    res.status(200).send(`Updated city.`)
                }
                break;
            case 3:
                state=update_value;
                const sqlGetUser3 = 'update airport set state = ? where airport_name = ?';
                const rows3 = await pool.query(sqlGetUser3,[state,oldairportname]);

                if(rows3){
                    res.status(200).send(`Updated state.`)
                }
                break;
        }

        res.status(200).send(`airport not found.`);
        
    } catch (error) {
        res.status(400).send(error.message)
    }
})
    
router.post('/delete', async function(req,res) {
    try {
        const {airportname} = req.body;
        const sqlQuery = 'DELETE from airport where airport_name = ?';
        const result = await pool.query(sqlQuery, airportname);

        res.status(200).json(result);
        
    } catch (error) {
        res.status(400).send(error.message)
    }
})
    
// router.get('/', async function(req,res){
//     try {
//         const sqlQuery = 'SELECT id, email, password, created_at FROM user WHERE id=?';
//         const rows = await pool.query(sqlQuery, req.params.id);
//         res.status(200).json(rows);
//     } catch (error) {
//         res.status(400).send(error.message)
//     }


//     res.status(200).json({id:req.params.id})
// });

// router.post('/register', async function(req,res) {
//     try {
//         const {email, password} = req.body;
        
//         const encryptedPassword = await bcrypt.hash(password,10)

//         const sqlQuery = 'INSERT INTO user (email, password) VALUES (?,?)';
//         const result = await pool.query(sqlQuery, [email, encryptedPassword]);

//         res.status(200).json({userId: result.insertId});
//     } catch (error) {
//         res.status(400).send(error.message)
//     }
// })

// router.post('/login', async function(req,res) {
//     try {
//         const {id,password} = req.body;

//         const sqlGetUser = 'SELECT password FROM user WHERE id=?';
//         const rows = await pool.query(sqlGetUser,id);
//         if(rows){
            
//             const isValid = await bcrypt.compare(password,rows[0].password)
//             res.status(200).json({valid_password: isValid});
//         }
//         res.status(200).send(`User with id ${id} was not found`);
        
//     } catch (error) {
//         res.status(400).send(error.message)
//     }
// })

module.exports = router;