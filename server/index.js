import express from "express";
import api from "./api";
import path from "path";
import exphbs from "express-handlebars";
import views from "./views";

const hbs = exphbs.create({});

const app = express();

// Middlewares
app.use(express.json());
app.set("views", path.join(__dirname, "views/templates"));
app.engine("handlebars", hbs.engine);
app.set("view engine", "handlebars");

// Routes
app.use("/api", api);
app.use("/", views);

export default app;
