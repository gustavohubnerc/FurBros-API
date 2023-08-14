import Joi from "joi";

export const newPetSchema = Joi.object({
    petName: Joi.string().required(),
    image: Joi.string().required(),
    about: Joi.string().required(),
})