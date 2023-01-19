import Image from "next/image"
import useMenu from "../hooks/useMenu"
import Categoria from "./Categoria"

const Sidebar = () => {
  const { categorias } = useMenu()
  return (
    <>
      <Image
        width={300}
        height={300}
        src="/assets/img/logo.svg"
        alt="Imagen logo sidebar"
      />
      <nav className="mt-5">
        {categorias.map(
          categoria => <Categoria key={categoria.id} categoria={categoria} />)}
      </nav>
    </>
  )
}

export default Sidebar