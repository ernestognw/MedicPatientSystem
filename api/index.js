import { Router } from "express";

const api = Router();

api.get("/", (req, res) => {
  res.status(200).send("API working");
});

export default api;
