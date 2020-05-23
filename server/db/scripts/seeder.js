import client from "../../db";
import fs from "fs";
import { resolve } from "path";

const createTables = async () => {
  await client.connect();

  console.log("SEEDING");
  const tablesScript = fs
    .readFileSync(resolve(__dirname, "../sql/seeders.pgsql"))
    .toString();

  await client.query(tablesScript);

  console.log("SEEDED");

  client.end();
};

createTables();
