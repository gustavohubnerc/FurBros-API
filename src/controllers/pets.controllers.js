import { db } from "../database/database.connection.js";

export async function addNewPet(req, res) {
    const { petName, image, about } = req.body;

    try {
        const phone = await db.query(`SELECT phone FROM users WHERE id = $1`, [req.userId]);

        await db.query(`INSERT INTO pets ("petName", image, about, "userId", "phoneInfo") VALUES ($1, $2, $3, $4, $5)`, [petName, image, about, req.userId, phone.rows[0].phone]);

        res.sendStatus(201);
    } catch (error) {
        res.status(500).send(error.message);
    }
}

export async function getPetsFromUser(req, res) {
    try {
        const pets = await db.query(`SELECT * FROM pets WHERE "userId" = $1`, [req.userId]);

        res.status(200).send(pets.rows);
    } catch (error) {
        res.status(500).send(error.message);
    }
}

export async function getAvailablePets(req, res){
    try {
        const pets = await db.query(`SELECT * FROM pets WHERE active = TRUE`);

        res.status(200).send(pets.rows);
    } catch (error) {
        res.status(500).send(error.message);
    }
}

export async function getPetById(req, res){
    const { id } = req.params;

    try {
        const pet = await db.query(`SELECT * FROM pets WHERE id = $1`, [id]);

        res.status(200).send(pet.rows[0]);
    } catch (error) {
        res.status(500).send(error.message);
    }
}

export async function updateAvailability(req, res){
    const { id } = req.params;

    try {
        const pet = await db.query(`SELECT * FROM pets WHERE id = $1`, [id]);
        if (pet.rowCount === 0) return res.status(404).send("Pet not found");

        const currentActiveStatus = pet.rows[0].active;
        const newActiveStatus = !currentActiveStatus;

        await db.query(`UPDATE pets SET active = $1 WHERE id = $2`, [newActiveStatus, id]);

        res.sendStatus(200);
    } catch (error) {
        res.status(500).send(error.message);
    }
}