# DBMS project - Airport Management

_Imagine an airport. What are the first things that come to mind? A cavernous terminal, information displays, long queues, baggage claim conveyors, arriving aircraft waiting to be fueled and catered for imminent departure. Airports have a tight flight schedule with its associated staff management, passenger processing, attention to minute detail, and much more. Proper airport management practices speed up the processes and improves the quality of service. <br/>
Airport management system is a database project implemented in MySQL. It primarily deals with the management of the airport, airlines, passengers, employees, ticket and flights for various airports. It is designed as per the airport management needs. There are a total of 11 tables each with a minimum of 5 records.<br/>
The system provides a broad overview of underlying operational factors that influence the airport management._

## Tools Used:
✈️ Frontend-  [`React`](https://reactjs.org/).

✈️Backend – [`Express`](https://expressjs.com/) for `Node Js`

✈️Database- [`MySQL`](https://www.mysql.com/) (from `xampp`)


## How To Use
Download the code and run `npm install` in the main project directory and in the frontend directory, to install the required dependencies specified in `package.json`.<br/>
Next up, create an .env-local file in your main project directory and specify the following - 
* PORT (The localhost port where your server should run) 
* DB_HOST (default `localhost`)
* DB_USER (default `root`)
* DB_NAME (name of your mysql database)

In the main project directory run the server by typing `npm run dev`. After this open another terminal and `cd` into the frontend directory and run `npm start` to start the website.

## ER Diagram 
![Airport_Management_ER_final](https://user-images.githubusercontent.com/68071562/203804163-d4720e93-b427-44d5-8f66-d583c9c3e790.png)



## Relational Schema
![Airport_Relational_Schema_final](https://user-images.githubusercontent.com/68071562/203804255-72606c99-a340-4728-b767-cf3d1223e986.png)



For accessing DDL and DML commands click [here](DDL_and_DML/).<br/>
Thanks for visiting.😄
