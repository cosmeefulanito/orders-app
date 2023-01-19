import axios from 'axios'
import Image from 'next/image'
import React from 'react'
import { formatCurrency } from '../helpers'
import { toast } from 'react-toastify'

export const Orden = ({ orden }) => {    
    const { id, nombre, fecha, total, pedido } = orden
    
    const handleTerminarOrden = async() => {
        console.log("ID orden: ", id)
        try {
            const data = await axios.post(`/api/ordenes/${id}`)
            // console.log(data)
            toast.success('Orden lista!')
        } catch (error) {
            toast.error('Ha ocurrido un error')
        }
    }
    return (

        <div className='border p-10 space-y-5'>
            <h2 className=' text-xl font-black'>N° Orden: {id}</h2>
            <p className='text-xl '>Nombre cliente: <span className=' font-bold'>{nombre}</span></p>
            <div>
                {pedido.map(comida =>
                    <div className='flex items-center border-b py-3'>
                        <div className='w-32'>
                            <Image
                                width={200}
                                height={100}
                                src={`/assets/img/${comida.imagen}.jpg`}
                                alt={comida.nombre}
                            />
                        </div>
                        <div className='p-5 space-y-2'>
                            {/*  */}
                            <h1 className='font-bold text-xl'>{comida.nombre}</h1>
                            <p className=' font-medium text-lg'>Cantidad: {comida.cantidad}</p>
                        </div>

                    </div>
                )}
                <div className='mt-5 flex justify-between'>
                    <p className=' font-medium text-2xl'>Total: <span className='font-bold '>{formatCurrency(total)}</span> </p>
                    <button 
                    type='button'
                    className='bg-yellow-500 hover:bg-yellow-700 font-semibold text-xl px-5 py-2 rounded-lg uppercase'
                    onClick={handleTerminarOrden}
                    >Cerrar orden</button>
                </div>
            </div>
        </div>
    )
}
