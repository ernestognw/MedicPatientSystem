import client from "../../db";
import fs from "fs";
import { resolve } from "path";

const createTables = async () => {
  await client.connect();

  console.log("ADDING TABLES");
  const tablesScript = fs
    .readFileSync(resolve(__dirname, "../sql/create-tables.pgsql"))
    .toString();

  await client.query(tablesScript);

  console.log("TABLES ADDED");

  client.end();
};

createTables();
