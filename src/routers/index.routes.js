import { Router } from "express";
import signRouter from "./sign.routes.js";
import petsRouter from "./pets.routes.js";

const router = Router();

router.use(signRouter);
router.use(petsRouter);

export default router;