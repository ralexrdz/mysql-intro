module.exports = (n) => {
  let resultado           = '';
  let caracteres       = ' ABCDEFGHIJKLMNOPQRSTUVWXYZ abcdefghijklmnopqrstuvwxyz 0123456789 ';
  for ( let i = 0; i < n; i++ ) {
    resultado += caracteres.charAt(Math.floor(Math.random() * n));
  }
  return resultado;
}