import Layout from "../layout/Layout"
import useMenu from "../hooks/useMenu"
import ProductosResumen from "../components/ProductosResumen"

export default function Resumen() {
    const {orden} = useMenu()
    return (
        <Layout pagina='Resumen'>
            <h1 className=" text-2xl font-black">Resumen</h1>
            <p className="text-xl font-medium mt-3">Revisa tu pedido</p>
            {orden.length === 0 ? 'No has agregado productos' : (
                orden.map( producto => 
                <ProductosResumen key={producto.id} producto={producto} />
                )
            )}
        </Layout>
    )
}