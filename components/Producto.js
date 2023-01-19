import Image from 'next/image';
import React from 'react'
import { formatCurrency } from '../helpers'
import useMenu from '../hooks/useMenu';

const Producto = ({ producto }) => {
  const { handleClickProducto,handleClickModal } = useMenu()
  const { nombre, precio, imagen } = producto;
  return (
    <div className='border p-3 text-center'>
      <div className='p-5'>
        <h2 className=' text-xl font-black'>{nombre}</h2>
        <span className='text-xl text-amber-600 font-bold '>{formatCurrency(precio)}</span>
      </div>
      <Image width={300} height={250} src={`/assets/img/${imagen}.jpg`} alt={`Imagen de producto ${nombre}`} />
      <button
        type='button'
        className='p-3 mt-3 rounded-md bg-lime-600 hover:bg-lime-800 text-white text-lg font-semibold'
        onClick={() => {
          handleClickProducto(producto)
          handleClickModal()
        }}>Ver producto</button>
    </div>
  )
}

export default Producto