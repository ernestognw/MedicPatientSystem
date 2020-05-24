import express from "express";
import server from "./server";
import client from "./server/db";

const port = process.env.PORT || 8000;

const start = async () => {
  await client.connect();
  console.log("Connected to db");

  await server.listen(port);
  console.log(`Server listening in port ${port}`);
};

start();
