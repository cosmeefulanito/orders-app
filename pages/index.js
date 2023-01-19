import Layout from '../layout/Layout'
import useMenu from '../hooks/useMenu'
import Producto from '../components/Producto'

export default function Home() {
  const { categoriaActual } = useMenu()

  return (
    <Layout pagina={categoriaActual?.nombre}>
      <h3 className='text-4xl font-black'>{categoriaActual?.nombre}</h3>
      <p className='text-2xl py-3'>Elige y personaliza tu pedido a continuación:</p>

      <div className='grid grid-cols-1 sm:grid-cols-2 md:grid-cols-2 lg:grid-cols-4 xl:grid-cols-5 gap-4'>
        {categoriaActual?.productos?.map(producto => <Producto key={producto.id} producto={producto} />)}
      </div>
    </Layout>

  )
}
