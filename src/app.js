const express = require("express");
const cors = require("cors");
const morgan = require("morgan");

const studentRoutes = require("./routes/studentRoutes");

const app = express();

app.use(express.json());
app.use(cors());
app.use(morgan("combined"));

// Healthcheck endpoint
app.get("/healthcheck", (req, res) => {
  res.status(200).json({
    status: "OK",
  });
});

// API versioning
app.use("/api/v1/students", studentRoutes);

module.exports = app;