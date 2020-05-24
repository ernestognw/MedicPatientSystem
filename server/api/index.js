import { Router } from "express";
import doctor from "./routes/doctor";
import patient from "./routes/patient";
import area from "./routes/area";
import treatment from "./routes/treatment";

const api = Router();

api.get("/", (req, res) => {
  res.status(200).send("API working");
});

api.use("/doctor", doctor);
api.use("/patient", patient);
api.use("/area", area);
api.use("/treatment", treatment);

export default api;
