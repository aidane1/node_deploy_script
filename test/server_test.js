// path: /test/server_test.js

const { expect } = require("chai");

const route = require(__dirname + "/../app/routes/all");

describe("Ensures the route function returns \"Hello, world!\"", () => {
	it("Invokes the function", () => {
		expect(route()).to.equal("Hello, worlds!");
	})
})