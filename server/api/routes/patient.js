import { Router } from "express";
import client from "../../db";

const patient = Router();

patient.get("/", async (req, res) => {
  const data = await client.query("SELECT * FROM PATIENT");

  res.status(200).send(data);
});

export default patient;
