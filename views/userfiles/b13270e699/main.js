const origArray = [2,3,4];

const f1 = document.getElementById('field1')
const f2 = document.getElementById('field2')
const f3 = document.getElementById('field3')

window.addEventListener('DOMContentLoaded', (event) => {
    f1.value = origArray[0];
    f2.value = origArray[1];
    f3.value = origArray[2];
});

function squareValues() {
    var newValues = origArray.map(function(value){
        return Math.pow(value, 2);
    });
    f1.value = newValues[0];
    f2.value = newValues[1];
    f3.value = newValues[2];
}
document.getElementById('square').addEventListener("click", squareValues);

document.getElementById('cube').addEventListener("click", function() {
    var newValues = origArray.map(function(value){
        return Math.pow(value, 3);
    });
    f1.value = newValues[0];
    f2.value = newValues[1];
    f3.value = newValues[2];
});

function toTheFourthValues() {
    var newValues = origArray.map(function(value){
        return Math.pow(value, 4);
    });
    f1.value = newValues[0];
    f2.value = newValues[1];
    f3.value = newValues[2];
}