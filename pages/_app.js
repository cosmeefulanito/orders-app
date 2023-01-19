import '../styles/globals.css'
import {MenuProvider} from '../context/MenuProvider'

function MyApp({ Component, pageProps }) {
  return (
    <MenuProvider>
      <Component {...pageProps} />
    </MenuProvider>
  )
}

export default MyApp
