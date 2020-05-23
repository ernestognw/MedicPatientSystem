import dotenv from "dotenv";

dotenv.config();

const postgresql = {
  url: process.env.DATABASE_URL
};

export { postgresql };
