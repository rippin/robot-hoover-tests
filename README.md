# Robotic Hoover Tests

This project provides a set of automated tests for the Robotic Hoover API. It uses a Behavior-Driven Development (BDD) approach with Cucumber and is written in JavaScript (Node.js). The tests cover various scenarios for navigating the hoover through a room, cleaning dirt patches, and handling edge cases.

## Table of Contents
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Running Tests](#running-tests)
- [Running Tests with Reporting](#running-tests-with-reporting)
- [Folder Structure](#folder-structure)
- [ESLint, Prettier, and lint-staged](#eslint-prettier-and-lint-staged)
- [License](#license)

## Prerequisites

Before setting up and installing, ensure you have the following installed on your system:
- [Node.js](https://nodejs.org/) (v18.x or above)
- [npm](https://www.npmjs.com/) (comes with Node.js)
- [Git](https://git-scm.com/)

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
│   ├── robot-hoover.feature   # Cucumber feature file defining scenarios
│   └── steps.js               # Step definitions to run feature scenarios
├── report                     # Test execution reports
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
npx prettier --write .
npx eslint --max-warnings 0 --no-warn-ignored .
```     

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
