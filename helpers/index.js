export const formatCurrency = (moneda) => {
    return moneda.toLocaleString('en-US', {
        style: 'currency',
        currency: 'USD'
    })
}