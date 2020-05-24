import pg, { Client } from "pg";
import { postgresql } from "../config";

const client = new Client({
  connectionString: postgresql.url
});

// pg.on("query", function(sql) {
//   console.log(sql);
// });

export default client;
