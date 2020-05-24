import { Router } from "express";

const app = Router();

app.get("/", (req, res) => {
  res.status(200).render("doctors");
});

app.get("/patients", (req, res) => {
  res.status(200).render("patients");
});

app.get("/treatments", (req, res) => {
  res.status(200).render("treatments");
});

app.get("/areas", (req, res) => {
  res.status(200).render("areas");
});

export default app;
