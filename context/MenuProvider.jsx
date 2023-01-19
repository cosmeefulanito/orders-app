import { useState, useEffect, createContext } from 'react'
import axios from "axios";
import { toast } from 'react-toastify';

import { useRouter } from 'next/router';

const MenuContext = createContext()

const MenuProvider = ({ children }) => {
    const [categorias, setCategorias] = useState([])
    const [categoriaActual, setCategoriaActual] = useState({})
    const [producto, setProducto] = useState({})
    const [modal, setModal] = useState(false)
    const [orden, setOrden] = useState([])
    const [paso, setPaso] = useState(1)
    const [nombre, setNombre] = useState('')
    const [total, setTotal] = useState(0)
    const router = useRouter()

    const obtenerCategorias = async () => {
        const { data } = await axios('/api/categorias')
        setCategorias(data)
    }

    const handleClickCategoria = (id) => {
        const categoria_seleccionada = categorias.filter(cat => cat.id === id)
        setCategoriaActual(categoria_seleccionada[0])
        router.push('/')
    }

    useEffect(() => {
        obtenerCategorias()
    }, [])

    // setea una categoria inicial
    useEffect(() => {
        setCategoriaActual(categorias[0])
    }, [categorias])

    // Calcula total cada que cambia la orden
    useEffect(() => {
        calcularTotal()
    }, [orden])

    const handleClickProducto = (producto) => {
        setProducto(producto)
    }

    const handleClickModal = () => {
        setModal(!modal)
    }
    // ************************** quita las propiedades categoriaId y mantiene el resto del objeto producto
    const handleClickAgregarProducto = ({ categoriaId, ...producto }) => {
        if (orden.some(productoState => productoState.id === producto.id)) {
            // ACTUALIZAR LA CANTIDAD
            const ordenActualizada = orden.map(productoState => productoState.id === producto.id ? producto : productoState);
            setOrden(ordenActualizada);
            toast.success("Orden actualizada");
        } else {
            setOrden([...orden, producto])
            toast.success("Producto agregado");
        }

        setModal(false)
        console.log("Producto: ", producto)

    }

    const handleClickActualizaPedido = (id) => {
        const productoSeleccionado = orden.filter(ord => ord.id === id)
        setProducto(productoSeleccionado[0])
        setModal(true)
    }

    const handleClickEliminarProducto = id => {
        console.log("id producto a eliminar: ", id)
        const ordenActualizada = orden.filter(ord => ord.id != id)
        console.log("array sin el producto: ", ordenActualizada)
        setOrden(ordenActualizada)
    }

    const calcularTotal = () => {
        const total = orden.reduce(
            (total, producto) => (producto.cantidad * producto.precio) + total, 0)
        setTotal(total)
    }

    const enviarOrden = async (e) => {
        e.preventDefault();
        console.log("Enviando orden...")
        console.log(orden)
        console.log(nombre)
        console.log(total)

        try {
            const { data } = await axios.post('/api/ordenes', { orden, nombre, total, fecha: Date.now().toString() })
            console.log("--> ", data)

            // Resetear APP            
            setCategoriaActual(categorias[0])          
            setOrden([])
            setPaso(1)
            setNombre('')
            setTotal(0)

            toast.success('Pedido realizado correctamente')
            setTimeout(() => {
                router.push('/')
            }, 2000);
        } catch (error) {
            console.log(error)
        }

    }

    


    return (
        <MenuContext.Provider value={{
            categorias,
            handleClickCategoria,
            categoriaActual,
            producto,
            handleClickProducto,
            modal,
            handleClickModal,
            handleClickAgregarProducto,
            orden,
            handleClickActualizaPedido,
            handleClickEliminarProducto,
            nombre,
            setNombre,
            total,
            enviarOrden
        }}>
            {children}
        </MenuContext.Provider>
    )
}

export {
    MenuProvider
}

export default MenuContext