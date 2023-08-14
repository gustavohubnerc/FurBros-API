import { Router } from "express";
import { addNewPet, getPetsFromUser, getAvailablePets, getPetById, updateAvailability } from "../controllers/pets.controllers.js";
import { newPetSchema } from "../schemas/newpet.schema.js";
import { validateSchema } from "../middlewares/schema.validation.js";
import { authenticateToken } from "../middlewares/auth.validation.js";

const petsRouter = Router();

petsRouter.post("/newpet", authenticateToken, validateSchema(newPetSchema), addNewPet);
petsRouter.get("/profile", authenticateToken, getPetsFromUser);
petsRouter.get("/home", authenticateToken, getAvailablePets);
petsRouter.get("/pets/:id", authenticateToken, getPetById);
petsRouter.put("/updatePetStatus/:id", authenticateToken, updateAvailability);

export default petsRouter;