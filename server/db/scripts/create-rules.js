import client from "../../db";
import fs from "fs";
import { resolve } from "path";

const createRules = async () => {
  await client.connect();

  console.log("ADDING RULES");
  const tablesScript = fs
    .readFileSync(resolve(__dirname, "../sql/create-rules.pgsql"))
    .toString();

  await client.query(tablesScript);

  console.log("RULES ADDED");

  client.end();
};

createRules();
