import dotenv from "dotenv";

dotenv.config();

const posgresql = {
  url: process.env.DATABASE_URL
};

export { postgresql };
