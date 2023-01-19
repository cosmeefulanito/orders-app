import Layout from "../layout/Layout"
import { useEffect, useCallback } from "react";
import { formatCurrency } from "../helpers";
import useMenu from "../hooks/useMenu";

export default function Total() {
    const {orden, nombre, setNombre,total, enviarOrden} = useMenu()
    

    const comprobarOrden = useCallback( () => {
        return orden.length === 0 || nombre === '' || nombre === undefined || nombre.length < 3;
    },[orden,nombre])

    useEffect( ()=> {
        console.log("...")
        comprobarOrden()
       
    },[orden, comprobarOrden])
    return (
        <Layout pagina='Resumen'>
            <h1 className=" text-2xl font-black">Total y confirmar pedido</h1>
            <p className="text-xl font-medium mt-3">Confirma tu pedido a continuación</p>
            <form onSubmit={enviarOrden}>
                <div className="mt-5">
                    <label htmlFor="nombre" className="font-bold text-xl uppercase block text-slate-800">Nombre</label>
                    <input 
                        type="text" 
                        id="nombre" 
                        className="bg-slate-200 rounded-lg w-full lg:w-1/3 p-2" 
                        autoComplete="off" 
                        value={nombre} 
                        onChange={ (e) => setNombre(e.target.value) } />
                </div>
                <div className="mt-5">
                    <p className="font-semibold text-2xl">Total pedido: <span className="font-bold">{formatCurrency(total)}</span> </p>
                </div>
                    <input 
                        type="submit" 
                        value="Confirmar pedido" 
                        className={`${comprobarOrden() ? 'bg-gray-500' : 'bg-lime-600 hover:bg-lime-800'} rounded-md py-2 px-5 text-xl font-semibold text-white w-full lg:w-1/5 mt-3`} 
                        disabled={comprobarOrden()} />
            </form>

        </Layout>
    )
}