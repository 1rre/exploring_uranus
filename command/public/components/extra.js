// /*
//  * This file contains additional JavaScript implementation that could be added later on.
//  * Buttons, update buttons, input boxes, innerText etc.
//  * Created by Giorgos Vyronos CID 01732688
//  */

// const leftToggle = function (event, button, newArg) {


//     console.log(event);
//     console.log(newArg);

//     let roverObject = roverObjectArray.find(
//         ({ id }) => id === button.parentElement.id
//     );

//     roverObject.direction.left == true
//         ? (roverObject.direction.left = false)
//         : (roverObject.direction.left = true);
    
//     button.innerText == "Stop Moving Left"
//         ? (button.innerText = "Move Left")
//         : (button.innerText = "Stop Moving Left")

//     let status = button.parentElement.querySelector(".rover__left span");
//     status.innerText == "Not Moving Left"
//         ? (status.innerText = "Moving Left")
//         : (status.innerText = "Not Moving Left");
    

// };

// const rightToggle = function (event, button, newArg) {

//     console.log(event);
//     console.log(newArg);

//     let roverObject = roverObjectArray.find(
//         ({ id }) => id === button.parentElement.id
//     );

//     roverObject.direction.right == true
//         ? (roverObject.direction.right = false)
//         : (roverObject.direction.right = true);
    
//     button.innerText == "Stop Moving Right"
//         ? (button.innerText = "Move Right")
//         : (button.innerText = "Stop Moving Right")

//     let status = button.parentElement.querySelector(".rover__right span");
//     status.innerText == "Not Moving Right"
//         ? (status.innerText = "Moving Right")
//         : (status.innerText = "Not Moving Right");
    

// };

// const upToggle = function (event, button, newArg) {

//     console.log(event);
//     console.log(newArg);

//     let roverObject = roverObjectArray.find(
//         ({ id }) => id === button.parentElement.id
//     );

//     roverObject.direction.up == true
//         ? (roverObject.direction.up = false)
//         : (roverObject.direction.up = true);
    
//     button.innerText == "Stop Moving Up"
//         ? (button.innerText = "Move Up")
//         : (button.innerText = "Stop Moving Up")

//     let status = button.parentElement.querySelector(".rover__up span");
//     status.innerText == "Not Moving Up"
//         ? (status.innerText = "Moving Up")
//         : (status.innerText = "Not Moving Up");
    

// };

// const downToggle = function (event, button, newArg) {

//     console.log(event);
//     console.log(newArg);

//     let roverObject = roverObjectArray.find(
//         ({ id }) => id === button.parentElement.id
//     );

//     roverObject.direction.down == true
//         ? (roverObject.direction.down = false)
//         : (roverObject.direction.down = true);
    
//     button.innerText == "Stop Moving Down"
//         ? (button.innerText = "Move Down")
//         : (button.innerText = "Stop Moving Down")

//     let status = button.parentElement.querySelector(".rover__down span");
//     status.innerText == "Not Moving Down"
//         ? (status.innerText = "Moving Down")
//         : (status.innerText = "Not Moving Down");
    

// };

// const clockwiseToggle = function (event, button, newArg) {

//     console.log(event);
//     console.log(newArg);

//     let roverObject = roverObjectArray.find(
//         ({ id }) => id === button.parentElement.id
//     );

//     roverObject.rotate.clockwise == true
//         ? (roverObject.rotate.clockwise = false)
//         : (roverObject.rotate.clockwise = true);
    
//     button.innerText == "Stop Rotating Clockwise"
//         ? (button.innerText = "Rotate Clockwise")
//         : (button.innerText = "Stop Rotating Clockwise")

//     let status = button.parentElement.querySelector(".rover__clockwise span");
//     status.innerText == "Not Rotating Clockwise"
//         ? (status.innerText = "Rotating Clockwise")
//         : (status.innerText = "Not Rotating Clockwise");
    

// };

// const anticlockwiseToggle = function (event, button, newArg) {

//     console.log(event);
//     console.log(newArg);

//     let roverObject = roverObjectArray.find(
//         ({ id }) => id === button.parentElement.id
//     );

//     roverObject.rotate.anticlockwise == true
//         ? (roverObject.rotate.anticlockwise = false)
//         : (roverObject.rotate.anticlockwise = true);
    
//     button.innerText == "Stop Rotating Anticlockwise"
//         ? (button.innerText = "Rotate Anticlockwise")
//         : (button.innerText = "Stop Rotating Anticlockwise")

//     let status = button.parentElement.querySelector(".rover__anticlockwise span");
//     status.innerText == "Not Rotating Anticlockwise"
//         ? (status.innerText = "Rotating Anticlockwise")
//         : (status.innerText = "Not Rotating Anticlockwise");
    

// };







// const newPositionValue = (positionArray) => {

//     positionArray.forEach((listElement) => {
        
//         let axis = listElement.getAttribute("data-side");
        
//         const valueForm = document.createElement("form");
//         valueForm.classList.add(`${axis}value`);

//         valueForm.innerHTML = `
//         <input type="number" name="${axis}Value" placeholder="New ${axis} length">
//         <button>Update</button>
//         `;

//         valueForm.addEventListener("submit", (e) => {

//             e.preventDefault();

//             let newValue = valueForm.querySelector("input").value;

//             listElement.querySelector("span").innerHTML = `${newValue} cm`;

//             valueForm.querySelector("input").value = "";
//         });

//         listElement.append(valueForm);
//     });
// };



// let positionValues = roverArticle.querySelectorAll(".rover__position");
    
// newPositionValue(positionValues);

// let buttonLeft = roverArticle.querySelector(".left-toggle");
// let buttonRight = roverArticle.querySelector(".right-toggle");
// let buttonUp = roverArticle.querySelector(".up-toggle");
// let buttonDown = roverArticle.querySelector(".down-toggle");
// let buttonClockwise = roverArticle.querySelector(".clockwise-toggle");
// let buttonAnticlockwise = roverArticle.querySelector(".anticlockwise-toggle");

// buttonLeft.addEventListener("click", (event) => {
//     leftToggle(event, buttonLeft, "Left Movement Triggered");
// });

// buttonRight.addEventListener("click", (event) => {
//     rightToggle(event, buttonRight, "Right Movement Triggered");
// });

// buttonUp.addEventListener("click", (event) => {
//     upToggle(event, buttonUp, "Up Movement Triggered");
// });

// buttonDown.addEventListener("click", (event) => {
//     downToggle(event, buttonDown, "Down Movement Triggered");
// });

// buttonClockwise.addEventListener("click", (event) => {
//     clockwiseToggle(event, buttonClockwise, "Clockwise Rotation Triggered");
// });

// buttonAnticlockwise.addEventListener("click", (event) => {
//     anticlockwiseToggle(event, buttonAnticlockwise, "Anticlockwise Rotation Triggered");
// });

