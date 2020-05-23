<<<<<<< HEAD
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
=======
import { Router } from "express";
import person from "./routes/person";

const api = Router();

api.get("/", (req, res) => {
  res.status(200).send("API working");
});

api.use("/person", person);

export default api;
>>>>>>> d203b1ecc1a4cb935065af6365405d811d9257fc
