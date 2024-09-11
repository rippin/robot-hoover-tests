# Robotic Hoover Tests

This project provides a set of automated tests for the Robotic Hoover API. It uses a Behavior-Driven Development (BDD) approach with Cucumber and is written in JavaScript (Node.js). The tests cover various scenarios for navigating the hoover through a room, cleaning dirt patches, and handling edge cases.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Running Tests](#running-tests)
- [Running Tests with Reporting](#running-tests-with-reporting)
- [Folder Structure](#folder-structure)
- [ESLint, Prettier, and lint-staged](#eslint-prettier-and-lint-staged)
- [Testing Approach](#testing-approach)
- [Bugs Found](#bugs-found)
- [Summary](#Summary)
- [License](#license)

## Prerequisites

Before setting up and installing, ensure you have the following installed on your system:

- [Node.js](https://nodejs.org/) (v18.x or above)
- [npm](https://www.npmjs.com/) (comes with Node.js)
- [Git](https://git-scm.com/)
- You will also need the sdet-assignment.jar and all the application and docker files but I will not provide that here. You should have the API Service up and running.

## Installation

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/rippin/robot-hoover-tests.git
   ```

2. **Navigate to the Project Directory:**

   ```bash
   cd robot-hoover-tests
   ```

3. **Install the Dependencies:**

   Install all the required dependencies by running:

   ```bash
   npm install
   ```

   This will install the necessary Node.js packages as defined in `package.json`.

4. **You will also need to set an environment variable for the URL**

   ```bash
     export BASE_URL="http://localhost:8080" #default BASE_URL is already localhost so you don't actually need to set this unless you want to change the URL.
   ```

## Running Tests

Once the dependencies are installed, you can run the tests using Cucumber.js. There are multiple ways to execute the tests:

### Run All Tests:

To run all the test scenarios:

```bash
npm test
```

## Running Tests with Reporting

Cucumber provides the `--publish` option to automatically generate a public report. After the test run is complete, a URL will be generated where you can view the report.

### Run Tests with Reporting:

To run all tests and publish the report:

```bash
npx cucumber-js --publish
```

This will generate a public report link, which will be printed in the terminal output after the tests have been completed.

### Example Output:

```bash
https://reports.cucumber.io/report-abcdefg
```

Simply open the URL to view the detailed test report.

## Folder Structure

The repository follows this folder structure:

```bash
├── features
│   ├── hoover.feature         # Cucumber feature file defining scenarios
│   └── invalid-inputs.feature # Cucumber feature file defining scenarios
│   └── steps.js               # Step definitions to run feature scenarios
├── helpers
│   ├── apiHelpers.js          # Helper file for the api
│   └── utils.js               # Utils file
├── package.json               # Project dependencies and scripts
└── README.md                  # Project instructions
```

## ESLint, Prettier, and lint-staged

### ESLint

ESLint is used to identify and report on patterns found in ECMAScript/JavaScript code. To run ESLint:

```bash
npm run lint
```

### Prettier

Prettier is an opinionated code formatter. To format your code with Prettier:

```bash
npm run format
```

To check the format for errors or warnings run:

```bash
npm run format:check
```

### lint-staged

lint-staged runs linters on pre-committed files.

When running git commit, lint-staged will run these pre-commit checks

```bash
npx prettier --check .
npx eslint --max-warnings 0 --no-warn-ignored .
```

## Testing Approach

### Assumptions

To begin I read the README.md provided and read the instructions and created these requirements and assumptions.

Post request payload

```bash
"roomSize"    #[x, y] must be positive integers and is a required field

"coords"      #[x, y] must be positive integers within roomSize dimensions and is a required field

"patches"     #[ [a,b], [x,y],...] must be a 2D array of positive integers within the room dimensions, not a mandatory field (room can be clean)

"instructions" #'NSWE' A string must contain only characters 'N,S,W,E' and is required (could also make a case for making this optional if you just want to clean at starting position)
```

Response body

```bash
  "coords" :  # [x, y], should return a final position within the boundaries and correctly follows the instructions
  "patches" : # {int} should return an integer >= 0 and the correct amount of cleaned patches (can only be cleaned once)
```

If any of the required fields are missing or empty then the API should throw a 400 Bad Request error.
If any of the fields contain invalid values/data then the API should throw a 400 Bad Request error.
An ok request should return a 200 status with the correct coords and correct cleaned patches.

## Bugs Found

- Invalid values for "instructions" throws no error or response body.
- Lowercase characters in "instructions" gives no error or response body.
- Starting "coords", with missing, invalid values or empty values give no errors.
- "roomSize" with negative values gives no error, empty/missing gives 500 status not 400.
- Negative numbers on "patches" gives no error or response body.
- "patches" array with missing values or invalid values give no error or response body.
- Starting on a dirt patch does not clean it unless you go East after.
- Cleaned "patches" number is wrong. (For pretty much every test case)
- When there is an error the API should return a message that describes the error.
- For all missing required fields or invalid values it should give a 400 error but some of them it doesn't give errors or provide the wrong error (500).

## Summary

I tried to treat this assignment like I would if I was assigned to do this on the job. I made assumptions as I did not have access to any other documentation or requirements besides the README.md provided.

I tried to cover various test cases both positive and negative and edge cases. I did not cover every possible scenario as I felt this was enough test coverage for this assignment and would give enough feedback for the reviewers.

I set up the project with linting and formatting for consistency.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

> > > > > > > eric-franco-hoover
