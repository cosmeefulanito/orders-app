import Image from 'next/image'
import { useState,useEffect } from 'react'

import useMenu from '../hooks/useMenu'
import { formatCurrency } from '../helpers'

const ModalProducto = () => {
    const { producto, handleClickModal, handleClickAgregarProducto, orden } = useMenu()
    const [cantidad, setCantidad] = useState(1)    
    const [edicion, setEdicion] = useState(false)
    

    useEffect( ()=> {
        if(orden.some( ordenState => ordenState.id === producto.id )){            
            const productoFiltro = orden.find( ordenState => ordenState.id === producto.id )
            setEdicion(true)
            setCantidad(productoFiltro.cantidad);
            console.log("Existe!")            
        }

    },[producto, orden])

    return (
        <div className='flex gap-10'>
            <div className=' md:w-1/3'>
                <Image
                    width={300}
                    height={200}
                    alt={`${producto.nombre}`}
                    src={`/assets/img/${producto.imagen}.jpg`}
                />
            </div>
            <div className=' md:w-2/3'>
                <div className='flex justify-end'>
                    <button onClick={handleClickModal}>
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="currentColor" className="w-6 h-6">
                            <path strokeLinecap="round" strokeLinejoin="round" d="M6 18L18 6M6 6l12 12" />
                        </svg>
                    </button>
                </div>
                <h1 className='text-3xl font-bold'>{producto.nombre}</h1>
                <p className=' text-2xl font-black text-amber-600'>{formatCurrency(producto.precio)}</p>
                <div className='flex gap-4 mt-3'>
                    <button onClick={() => {
                        if (cantidad <= 1) return false
                        setCantidad(cantidad - 1)
                    }
                    }>
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="currentColor" className="w-6 h-6">
                            <path strokeLinecap="round" strokeLinejoin="round" d="M15 12H9m12 0a9 9 0 11-18 0 9 9 0 0118 0z" />
                        </svg>
                    </button>

                    <span className='font-semibold text-2xl'>{cantidad}</span>

                    <button onClick={() => {
                        if (cantidad >= 5) return false
                        setCantidad(cantidad + 1)
                    }
                    }>
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="currentColor" className="w-6 h-6">
                            <path strokeLinecap="round" strokeLinejoin="round" d="M12 9v6m3-3H9m12 0a9 9 0 11-18 0 9 9 0 0118 0z" />
                        </svg>
                    </button>
                </div>
                <button className='font-bold text-xl rounded-md bg-indigo-300 hover:bg-indigo-600 mt-4 p-3'
                    onClick={() => handleClickAgregarProducto({ ...producto, cantidad })}>{edicion ? 'Guardar cambios' : 'Añadir al pedido'}</button>
            </div>
        </div>
    )
}

export default ModalProducto