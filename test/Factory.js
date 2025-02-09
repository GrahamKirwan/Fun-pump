const { loadFixture } = require("@nomicfoundation/hardhat-toolbox/network-helpers")
const { expect } = require("chai")
const { ethers } = require("hardhat")

describe("Factory", function () {
    const FEE = ethers.parseUnits("0.01", 18)

    async function deployFactoryFixtures() {
        // Fetch the contract
        const Factory = await ethers.getContractFactory("Factory")
        // Deploy the contract
        const factory = await Factory.deploy(FEE)

        return { factory }
    }

    describe("Deployment", function() {
        it("Should set the fee", async function(){
            const { factory } = await loadFixture(deployFactoryFixtures)
            expect(await factory.fee()).to.equal(FEE)
        })
    })

//     it("should have a name", async function() {
//         const { factory } = await deployFactoryFixtures()
//         // Check name
//         const name = await factory.name()
//         // Check name is correct
//         expect(name).to.equal("Factory")
//     })

//     it("should have a name2", async function() {
//         const { factory } = await deployFactoryFixtures()
//         // Check name
//         const name2 = await factory.name2()
//         // Check name is correct
//         expect(name2).to.equal("Factory2")
//     })
})
