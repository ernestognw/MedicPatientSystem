import { Router } from "express";
import client from "../../db";

const person = Router();

person.get("/", async (req, res) => {
  const data = await client.query("SELECT * FROM pg_catalog.pg_tables;");
  res.status(200).send(data)
});

export default person;
