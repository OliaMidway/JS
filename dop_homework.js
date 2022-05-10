// 1. Написать скриптик, который сосчитает и выведет результат от возведения 2 в степень 10, начиная со степени 1

// let n = 2

// for(let a = 1; a <= 10; a++){
//     let b = n**a
//     console.log(b)
// }

// 1*. Преобразовать 1 задачу в функцию, принимающую на вход степень, в которую будет возводиться число 2

// let n = 2

// const vozvedenie = function(stepen) {
//     console.log(n**stepen)
// }

// vozvedenie(5)

// 2. Написать скрипт, который выведет 5 строк в консоль таким образом, чтобы в первой строчке выводилось :), во второй :):) и так далее
// Пример в консоли:
// :)
// :):)
// :):):)
// :):):):)
// :):):):):)

// let smile = ':)'
// let a = ''

// for(i = 0; i < 5; i++) {
//     a = a + smile
//     console.log(a)
// }

// 2*. Преобразовать 2 задачу в функцию, принимающую на вход строку, которая и будет выводиться в консоль (как в условии смайлик), а также количество строк для вывода 
// e.g. function printSmile(stroka, numberOfRows)

// const printSmile = function(stroka, numberOfRows) {
//     let a = ''
//     for(i = 0; i < numberOfRows; i++) {
//         a = a + stroka
//         console.log(a)
//     }
// }

// printSmile('$', 56)

// 3**.  Написать функцию, которая принимает на вход слово. Задача функции посчитать и вывести в консоль, сколько в слове гласных, и сколько согласных букв.
// e.g. function getWordStructure(word)
// В консоли: 
// Слово (word) состоит из  (число) гласных и (число) согласных букв

// Проверки: 'case', 'Case', 'Check-list'

// function f(str = "hieeelalaooo") {
//     str = str.toLowerCase();
//     let vowels = "aeiouy";
//     let consonants = "bcdfghjklmnpqrstvwxz";
    
//     let vowelCount = 0
//     let consonantCount = 0

//     for (let i = 0; i < str.length; i++) {
//         let currentLetter = str[i];
//         if (vowels.includes(currentLetter)) {
//             vowelCount++
//         }
//         else if (consonants.includes(currentLetter)) {
//             consonantCount++
//         }
//     }
//     console.log(`Слово ${str} состоит из  ${vowelCount} гласных и ${consonantCount} согласных букв`)
// }

// f("MEga word -!@#!@#")

// 4**. Написать функцию, которая проверяет, является ли слово палиндромом
// e.g. function isPalindrom(word)

// Проверки: 'abba', 'Abba'

function isPalindrom(str){
    str = str.toLowerCase();
    let len = Math.floor(str.length / 2)
    for(let i = 0; i < len; i++ ){
        
        let front = str[i]
        let bottom = str[str.length - i - 1]
        if(front !== bottom){
            console.log(`${str} не полиндром`)
            return false
        }
    }
     console.log(`${str} полиндром`)
    return true
}

isPalindrom('Abba')