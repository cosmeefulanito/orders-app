import Image from 'next/image'
import React from 'react'
import { formatCurrency } from '../helpers'
import useMenu from '../hooks/useMenu'

const ProductosResumen = ({ producto }) => {
  const {handleClickActualizaPedido,handleClickEliminarProducto} = useMenu()
  return (
    <div className='shadow p-5 m-3 flex gap-3 items-center'>
      <div className='md:w-1/6 bg-rose-200'>
        <Image
          alt={`producto ${producto.nombre}`}
          width={300}
          height={200}
          src={`/assets/img/${producto.imagen}.jpg`}
        />
      </div>
      <div className=' md:w-4/6  text'>
        <p className=' text-3xl font-bold '>{producto.nombre}</p>
        <p className=' text-xl font-bold'>Cantidad: {producto.cantidad}</p>
        <p className=' text-xl font-bold'>Precio: {producto.precio}</p>
        <p className=' text-lg font-bold text-stone-400'>Subtotal: {formatCurrency(producto.precio * producto.cantidad)}</p>
      </div>
      <div className='md:w-1/6 p-3'>
        <button type="button" className='bg-blue-900 hover:bg-blue-500 text-white font-bold text-xl rounded-lg px-10 py-3 mb-3 w-full flex gap-2 items-center'
        onClick={()=> handleClickActualizaPedido(producto.id)}>          
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="currentColor" className="w-6 h-6">
            <path strokeLinecap="round" strokeLinejoin="round" d="M16.862 4.487l1.687-1.688a1.875 1.875 0 112.652 2.652L6.832 19.82a4.5 4.5 0 01-1.897 1.13l-2.685.8.8-2.685a4.5 4.5 0 011.13-1.897L16.863 4.487zm0 0L19.5 7.125" />
          </svg>
          Editar</button>

        <button type="button" className='bg-red-900 hover:bg-red-500 text-white font-bold text-xl rounded-lg px-10 py-3 w-full flex gap-2 items-center'
        onClick={ () => handleClickEliminarProducto(producto.id) }>          
          <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" strokeWidth={1.5} stroke="currentColor" className="w-6 h-6">
            <path strokeLinecap="round" strokeLinejoin="round" d="M14.74 9l-.346 9m-4.788 0L9.26 9m9.968-3.21c.342.052.682.107 1.022.166m-1.022-.165L18.16 19.673a2.25 2.25 0 01-2.244 2.077H8.084a2.25 2.25 0 01-2.244-2.077L4.772 5.79m14.456 0a48.108 48.108 0 00-3.478-.397m-12 .562c.34-.059.68-.114 1.022-.165m0 0a48.11 48.11 0 013.478-.397m7.5 0v-.916c0-1.18-.91-2.164-2.09-2.201a51.964 51.964 0 00-3.32 0c-1.18.037-2.09 1.022-2.09 2.201v.916m7.5 0a48.667 48.667 0 00-7.5 0" />
          </svg>
          Eliminar</button>
      </div>
    </div>
  )
}

export default ProductosResumen