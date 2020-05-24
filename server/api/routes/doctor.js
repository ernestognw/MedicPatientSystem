import { Router } from "express";
import client from "../../db";

const doctor = Router();

doctor.get("/", async (req, res) => {
  const data = await client.query("SELECT * FROM DOCTOR");

  res.status(200).send(data);
});

export default doctor;
