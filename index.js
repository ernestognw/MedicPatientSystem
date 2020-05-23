import express from "express";
import app from "./app";

const port = process.env.PORT || 8000;

const start = async () => {
  await app.listen(port);
  console.log(`Server listening in port ${port}`);
};

start();
