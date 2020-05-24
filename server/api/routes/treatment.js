import { Router } from "express";
import client from "../../db";

const treatment = Router();

treatment.get("/", async (req, res) => {
  const data = await client.query("SELECT * FROM TREATMENT");

  res.status(200).send(data);
});

export default treatment;
