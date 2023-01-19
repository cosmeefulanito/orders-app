import { prisma, PrismaClient } from "@prisma/client"

export default async function handler(req, resp) {
    const prisma = new PrismaClient();
    // Obtener ordenes
    const ordenes = await prisma.orden.findMany({
        where: {
            estado: false
        }
    })
    resp.status(200).json(ordenes)

    // Crear ordenes
    if (req.method === 'POST') {        
        const result = await prisma.orden.create({
            data: {
                nombre: req.body.nombre,
                fecha: req.body.fecha,
                total: req.body.total,
                pedido: req.body.orden
            }
        })
        console.log("***: ", result)
        resp.json(result)
    }

}