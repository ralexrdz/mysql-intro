const moment = require('moment');
const ObjectsToCsv = require('objects-to-csv');
const creaRandomString = require('./creaRandomString')
const creaFechaRandom = require('./creaFechaRandom')

let fechaInicio = new Date(2010, 0, 1)
let fechaFin = new Date(2019, 0, 1)

const data = new Array(1000).fill({}).map( p=> {
  return {
    nombre: creaRandomString(10),
    descripcion: creaRandomString(40),
    cantidad_piso: Math.floor(Math.random()*20),
    cantidad_altillo: Math.floor(Math.random()*20),
    fecha_registro: moment(creaFechaRandom(fechaInicio, fechaFin, 0, 23)).format('YYYY-MM-DD h:mm')
  }
});
 
(async () => {
  const csv = new ObjectsToCsv(data);
 
  await csv.toDisk('./productos.csv');
  console.log('listo')
})()
