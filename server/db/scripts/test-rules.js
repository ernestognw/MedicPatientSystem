import client from "../../db";
import fs from "fs";
import { resolve } from "path";

const createTables = async () => {
  await client.connect();

  console.log("TESTING RULES");
  const tablesScript = fs
    .readFileSync(resolve(__dirname, "../sql/test-rules.pgsql"))
    .toString();

  const res = await client.query(tablesScript);

  client.end();
};

createTables();
