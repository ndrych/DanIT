const express = require('express');

// Create an Express application instance
const app = express();
//
// Define a route for the root URL
app.get('/', (req, res) => {
    // Define a simple JSON response
    const data = {
        message: 'Hello, World!'
    };
 // SetContent-Type header to application/json and send JSON response
    res.setHeader('Content-Type', 'application/json');
    res.status(200).json(data);
});

app.get('/healthz', (req, res) => {
    const data = {
        status: 'OK'
    };
    // Set Content-Type header to application/json and send JSON response
    res.setHeader('Content-Type', 'application/json');
    res.status(200).json(data);
});
// Start the Express server
const port = process.env.PORT || 3000;
app.listen(port, () => {
    console.log(`Server is running on port ${port}`);
});

