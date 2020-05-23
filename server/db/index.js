import { Client } from "pg";
import { postgresql } from "../config";

const client = new Client({
  connectionString: postgresql.url
});

client.connect();

export default client;
