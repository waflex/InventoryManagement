const timeago = timestamp => format(timestamp, 'es_ES');
const helpers = {};

helpers.timeago = (timestamp) => {
    return timeago(timestamp);
};


helpers.comparar = ("when", (operand_1, operator, operand_2, options) => {
    let operators = { //  {{#when <operand1> 'eq' <operand2>}}
        'eq': (l, r) => l == r, //  {{/when}}
        'noteq': (l, r) => l != r,
        'gt': (l, r) => (+l) > (+r), // {{#when var1 'eq' var2}}
        'gteq': (l, r) => ((+l) > (+r)) || (l == r), //               eq
        'lt': (l, r) => (+l) < (+r), // {{else when var1 'gt' var2}}
        'lteq': (l, r) => ((+l) < (+r)) || (l == r), //               gt
        'or': (l, r) => l || r, // {{else}}
        'and': (l, r) => l && r, //               lt
        '%': (l, r) => (l % r) === 0 // {{/when}}
    };
    let result = operators[operator](operand_1, operand_2);
    if (result) return options.fn(this);
    return options.inverse(this);
});

module.exports = helpers;

//Timeago to español
const { format, register } = require('timeago.js'); //Puede utilizar `import` para Javascript code.

register('es_ES', (number, index, total_sec) => [
    ['justo ahora', 'ahora mismo'],
    ['hace %s segundos', 'en %s segundos'],
    ['hace 1 minuto', 'en 1 minuto'],
    ['hace %s minutos', 'en %s minutos'],
    ['hace 1 hora', 'en 1 hora'],
    ['hace %s horas', 'in %s horas'],
    ['hace 1 dia', 'en 1 dia'],
    ['hace %s dias', 'en %s dias'],
    ['hace 1 semana', 'en 1 semana'],
    ['hace %s semanas', 'en %s semanas'],
    ['1 mes', 'en 1 mes'],
    ['hace %s meses', 'en %s meses'],
    ['hace 1 año', 'en 1 año'],
    ['hace %s años', 'en %s años']
][index]);



console.log(timeago('2019-11-15'));