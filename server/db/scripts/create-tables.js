import client from "../../db";
import fs from "fs";
import { resolve } from "path";

const createTables = async () => {
  await client.connect();

  const tablesScript = fs
    .readFileSync(resolve(__dirname, "./create-tables.pgsql"))
    .toString();

  console.log(tablesScript);

  await client.query(tablesScript);
};

createTables();
