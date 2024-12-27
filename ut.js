// Calculator constructor function
function Calculator() {
    this.result = 0;
}

// Addition method
Calculator.prototype.add = function(num) {
    this.result += num;
};

// Subtraction method
Calculator.prototype.subtract = function(num) {
    this.result -= num;
};

// Multiplication method
Calculator.prototype.multiply = function(num) {
    this.result *= num;
};

// Division method
Calculator.prototype.divide = function(num) {
    if (num !== 0) {
        this.result /= num;
    } else {
        console.log("Error: Division by zero is not allowed.");
    }
};

// Create a new calculator object
const calculator = new Calculator();

// Perform calculations
calculator.add(5);
calculator.subtract(2);
calculator.multiply(3);
calculator.divide(4);

// Print the result
console.log("Result:", calculator.result);