<<<<<<< HEAD
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
=======
import { Client } from "pg";
import { postgresql } from "../config";

const client = new Client({
  connectionString: postgresql.url
});

client.connect();

export default client;
>>>>>>> d203b1ecc1a4cb935065af6365405d811d9257fc
