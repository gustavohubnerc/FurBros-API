import { Router } from "express";
import { createUser, signIn } from "../controllers/sign.controllers.js";
import { signinSchema } from "../schemas/signin.schema.js";
import { signupSchema } from "../schemas/signup.schema.js";
import { validateSchema } from "../middlewares/schema.validation.js";

const signRouter = Router();

signRouter.post("/signup", validateSchema(signupSchema), createUser);
signRouter.post("/", validateSchema(signinSchema), signIn);

export default signRouter;

