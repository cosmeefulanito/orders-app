import AdminLayout from "../layout/AdminLayout";
import useSWR from 'swr'
import axios from "axios";
import { Orden } from "../components/Orden";

export default function admin(){
    const fetcher = () => axios('/api/ordenes').then(datos => datos.data)
    const { data, error, isLoading } = useSWR('/api/ordenes', fetcher,{refreshInterval:100})

    console.log("Data: ", data)
    console.log("Error: ", error)
    console.log("isLoading: ", isLoading)
    return (
        <AdminLayout pagina={'Administracion'}>
            <h1 className=" text-2xl font-black">Panel de administración</h1>
            <p className="text-xl font-medium mt-3">Administra los pedidos pendientes </p>
            {data && data.length > 0 ? data.map( orden => 
                <Orden key={orden.id} orden={orden} />
                ): <p>No hay pedidos pendientes</p>}
            
        </AdminLayout>
    )
}