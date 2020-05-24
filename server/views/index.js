import { Router } from "express";
import client from "../db";

const app = Router();

app.get("/", async (req, res) => {
  const doctors = await client.query("SELECT * FROM DOCTOR");
  res.status(200).render("doctors", {
    doctors: doctors.rows
  });
});

app.get("/patients", async (req, res) => {
  const patients = await client.query("SELECT * FROM PATIENT");
  res.status(200).render("patients", {
    patients: patients.rows
  });
});

app.get("/treatments", async (req, res) => {
  const treatments = await client.query("SELECT * FROM TREATMENT");
  res.status(200).render("treatments", {
    treatments: treatments.rows
  });
});

app.get("/areas", async (req, res) => {
  const areas = await client.query("SELECT * FROM AREA");
  res.status(200).render("areas", {
    areas: areas.rows
  });
});

export default app;
