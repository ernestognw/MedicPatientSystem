import { Client } from "pg";
import { postgresql } from "../config";

const client = new Client({
  connectionString: postgresql.url
});

export default client;
