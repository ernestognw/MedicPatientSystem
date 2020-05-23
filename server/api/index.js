import { Router } from "express";
import person from "./routes/person";

const api = Router();

api.get("/", (req, res) => {
  res.status(200).send("API working");
});

api.use("/person", person);

export default api;
