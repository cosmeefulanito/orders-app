import Image from "next/image"
import useMenu from "../hooks/useMenu"

const Categoria = ({ categoria }) => {
  const { id, nombre, icono } = categoria
  const { handleClickCategoria, categoriaActual } = useMenu()


  return (
    <div
      className={`${categoriaActual?.id === id ? 'bg-amber-300' : 'ring-offset-amber-900'} hover:bg-amber-300 flex items-center gap-4 border p-3`}>
      <Image width={70} height={70} src={`/assets/img/icono_${icono}.svg`} alt={`imagen de la categoria ${nombre}`} />
      <button type="button" onClick={() => handleClickCategoria(id)}>{nombre}</button>
    </div>
  )
}

export default Categoria