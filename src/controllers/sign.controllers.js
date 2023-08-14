import { db } from "../database/database.connection.js";
import bcrypt from "bcrypt";
import { v4 as uuidv4 } from "uuid";

export async function createUser(req, res){
    const { name, email, cpf, phone, password } = req.body;
    
    try {
        const userExists = await db.query(`SELECT id FROM users WHERE email = $1`, [email]);
        if(userExists.rowCount > 0) return res.status(409).send("User already exists");
        
        const existingCpf = await db.query(`SELECT cpf FROM users WHERE cpf = $1`, [cpf]);
        if(existingCpf.rowCount > 0) return res.status(409).send("Enter another CPF");

        const hashPassword = bcrypt.hashSync(password, 10);
       
        await db.query(`INSERT INTO users (name, email, cpf, phone, password) VALUES ($1, $2, $3, $4, $5)`, [name, email, cpf, phone, hashPassword]);
        
        res.sendStatus(201);
    } catch (error) {
        res.status(500).send(error.message);
    }
}

export async function signIn(req, res){
    const { email, password } = req.body;

    try {
        const user = await db.query(`SELECT id, email, password FROM users WHERE email = $1`, [email]);
        if(!user.rows[0]) return res.status(401).send("User not found");

        const validPassword = bcrypt.compareSync(password, user.rows[0].password);
        if(!validPassword) return res.status(401).send("Invalid password");

        const token = uuidv4();

        await db.query(`INSERT INTO sessions (token, "userId") VALUES ($1, $2)`, [token, user.rows[0].id]);
        
        res.status(200).send({token: token});
    } catch (error) {
        res.status(500).send(error.message);
    }
}