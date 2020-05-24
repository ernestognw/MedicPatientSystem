import { Router } from "express";
import client from "../../db";

const area = Router();

area.get("/", async (req, res) => {
  const data = await client.query("SELECT * FROM AREA");

  res.status(200).send(data);
});

export default area;
