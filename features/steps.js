import assert from 'assert';
import { containsOnlySpecificChars } from '../helpers/utils.js';
import { sendHooverRequest } from '../helpers/apiHelper.js';
import { Given, Then, When } from '@cucumber/cucumber';

// Before((scenario) => {
//     console.log(`Starting scenario (${scenario.pickle.name})`);
// });

Given('the room size is {int} by {int}', function (width, height) {
  this.roomSize = [width, height];
});

Given('the hoover starts at {int}, {int}', function (x, y) {
  this.coords = [x, y];
});

Given('the patches of dirt are:', function (dataTable) {
  this.patches = dataTable.raw().map((row) => {
    const x = parseInt(row[0]);
    const y = parseInt(row[1]);

    if (!Number.isInteger(x) || !Number.isInteger(y)) {
      this.error = true;
    }
    return [x, y];
  });
});

Given('the patches of dirt are missing', function () {
  this.patches = [];
});

When('the driving instructions are {string}', async function (instru) {
  if (!containsOnlySpecificChars(instru, 'NWSE')) {
    this.error = true;
  }
  this.instructions = instru;

  const payload = {
    roomSize: this.roomSize,
    coords: this.coords,
    patches: this.patches,
    instructions: this.instructions,
  };
  //console.warn(payload);
  this.response = await sendHooverRequest(payload);
});

Then('the final hoover position should be {int}, {int}', function (x, y) {
  if (!this.error && this.response.error) {
    throw new Error(`Expected valid output, but got error: ${this.result.error.message}`);
  }

  const coords = [x, y];

  assert.deepStrictEqual(this.response.data.coords, coords);
});

Given('the number of cleaned patches should be {int}', function (patches) {
  assert.strictEqual(this.response.data.patches, patches);
});

Then(
  'the request should return an error message {string} {string} {int}',
  function (error, message, status) {
    assert.strictEqual(this.response.status, status);
    assert.strictEqual(this.response.data.error, error);
    assert.strictEqual(this.response.data.message, message);
  }
);

Given('the room size is missing', function () {
  this.roomSize = [];
});

/* Bugs so far. 
Invalid instruction gives no error or response body
lowercase instructions gives no error
Starting coords, missing, invalid values, empty values give no error
Room Size negative values gives no error, empty/missing gives 500 not 400,
Negative number on patches gives no error or response body
Empty patches array gives no error, missing values or invalid values.
Starting on a dirt patch does not clean it unless you go East after
Cleaned patches number is wrong.
When there is an error the api should return a message that describes the error.
For all missing required fields or invalid values it should give a 400 error 
but some of them it doesn't give errors or provide the wrong error (500).
*/
