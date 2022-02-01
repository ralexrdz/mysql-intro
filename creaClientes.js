const moment = require('moment');
const ObjectsToCsv = require('objects-to-csv');
const creaRandomString = require('./creaRandomString')
const creaFechaRandom = require('./creaFechaRandom')

let fechaInicio = new Date(2010, 0, 1)
let fechaFin = new Date(2019, 0, 1)

const data = new Array(100).fill({}).map( p=> {
  return {
    nombres: creaRandomString(10),
    fecha_registro: moment(creaFechaRandom(fechaInicio, fechaFin, 0, 23)).format('YYYY-MM-DD h:mm'),
    niveles_idniveles: Math.ceil(Math.random()*4)
  }
});
 
(async () => {
  const csv = new ObjectsToCsv(data);
 
  await csv.toDisk('./clientes.csv');
  console.log('listo')
})()
