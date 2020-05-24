import express from "express";
import api from "./api";
import app from "./app";

const server = express();

// Middlewares
server.use(express.json());

// Routes
app.use("/", app);
app.use("/api", api);

export default server;
