import { Router } from "express";
const api = Router();

api.get("/", (req, res) => {
  res.status(200).send("API working");
});

api.get("/person", async (req, res) => {
  try {
    res.status(200).send([]);
  } catch (err) {
    console.log(err);
  }
});

export default api;
