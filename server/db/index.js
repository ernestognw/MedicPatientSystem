import Sequelize from "sequelize";
import { postgresql } from "../config";

const sequelize = new Sequelize(postgresql.url, {
  logging: false,
  maxConcurrentQueries: 100,
  dialect: "postgres",
  pool: { maxConnections: 5, maxIdleTime: 30 },
  language: "en"
});

export default sequelize;
