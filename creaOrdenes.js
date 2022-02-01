const moment = require('moment');
const ObjectsToCsv = require('objects-to-csv');
const creaFechaRandom = require('./creaFechaRandom')

let fechaInicio = new Date(2019, 0, 1)
let fechaFin = new Date(2022, 0, 1)

const data = new Array(10000).fill({}).map( p=> {
  return {
    clientes_idclientes: Math.ceil(Math.random()*100),
    producto_idproducto: Math.ceil(Math.random()*1000),
    tipo_entrega: ['piso', 'domicilio'][Math.round(Math.random())],
    estatus: ['lista', 'en curso'][Math.round(Math.random())],
    fecha_creacion: moment(creaFechaRandom(fechaInicio, fechaFin, 0, 23)).format('YYYY-MM-DD h:mm')
  }
});


(async () => {
  console.log(data.length)
  const csv = new ObjectsToCsv(data);
 
  await csv.toDisk('./ordenes.csv');
  console.log('listo')
})()
