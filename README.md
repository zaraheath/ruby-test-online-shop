Imagina que estamos implementando una tienda online, que vende solo 3 productos:

Codigo | Nombre | Precio

-------------------------------------------------

AM | Agua mineral | 3.11€

AC | Aceite | 5.00€

CA | Cafe | 11.23€

El departamento de marketing es fan de las promociones de tipo 2x1 (si compras dos 

productos iguales, uno de ellos es gratis). Y quiere que haya un descuento de este tipo en 

Agua mineral.

El CEO cree que lo mejor para aumentar las ventas es agregar descuentos por cantidad (al 

comprar x de un mismo producto, el precio por unidad baja). Y quiere que al comprar 3 o mas 

aceites, el precio por unidad sea de 4.50€.

El proceso de checkout permite escanear los productos en cualquier orden y debe devolver el 

total de la compra.

La interfaz del proceso de checkout es asi:

co = Checkout.new(pricing_rules)

 co.scan(item)

 co.scan(item)

price = co.total

Implementa el proceso de checkout que cumpla con estos requerimientos. Debes usar como 

lenguaje ruby y puedes utilizar las gemas que necesites.

Ejemplos:

---------

Items: AM,AC,AM,AM,CA

Precio total esperado: 22.45€

Items: AM,AM

Precio total esperado: 3.11€

Items: AC,AC,AM,AC

Precio total esperado: 16.61€