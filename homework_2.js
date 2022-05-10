let age_1 = 10;
let age_2 = 18;
let age_3 = 60;

// HW_1*
// const checkAge = function(age) {
//     if (age < age_2){
//         console.log("You don’t have access cause your age is " + age + " It’s less then " + age_2)
//     } else if(age >=  age_2 && age <  age_3) {
//         console.log("Welcome  !")
//     } else if(age  > age_3) {
//         console.log("Keep calm and look Culture channel")
//     } else {
//     console.log("Technical work")
//     }
// }

// checkAge(11)

// 2*:

// const checkAge = function(age) {
//     if(typeof(age) == "number") {
//         if (age < age_2){
//             console.log("You don’t have access cause your age is " + age + " It’s less then " + age_2)
//         } else if(age >=  age_2 && age <  age_3) {
//             console.log("Welcome  !")
//         } else if(age  > age_3) {
//             console.log("Keep calm and look Culture channel")
//         } 
//     } else { console.log("Not integer value")}
// }

// checkAge(1)

// 3**:

const checkAge = function(age) {
    age = Number(age)
    if(!isNaN(age)) {
        if (age < age_2){
            console.log("You don’t have access cause your age is " + age + " It’s less then " + age_2)
        } else if(age >=  age_2 && age <  age_3) {
            console.log("Welcome  !")
        } else if(age  > age_3) {
            console.log("Keep calm and look Culture channel")
        } 
    } else { console.log("Not integer value")}
}

checkAge('bhj')
checkAge("2")
checkAge(61)

// 4**:

let agePrompt = prompt("Enter age")
checkAge(agePrompt)