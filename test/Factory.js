const { loadFixture } = require("@nomicfoundation/hardhat-toolbox/network-helpers")
const { expect } = require("chai")
const { ethers } = require("hardhat")

describe("Factory", function () {
    const FEE = ethers.parseUnits("0.01", 18)

    async function deployFactoryFixtures() {
        // Fetch accounts
        const [deployer, creator] = await ethers.getSigners()

        // Fetch the contract
        const Factory = await ethers.getContractFactory("Factory")
        // Deploy the contract
        const factory = await Factory.deploy(FEE)

        // Create token
        const transaction = await factory.connect(creator).create("Koby", "KOBY", {value: FEE})
        await transaction.wait()

        // Get token address
        const tokenAddress = await factory.tokens(0)
        const token = await ethers.getContractAt("Token", tokenAddress)

        return { factory, token, deployer, creator }
    }

    describe("Deployment", function() {
        it("Should set the fee", async function(){
            const { factory } = await loadFixture(deployFactoryFixtures)
            expect(await factory.fee()).to.equal(FEE)
        })

        it("Should set the owner", async function(){
            const { factory, deployer } = await loadFixture(deployFactoryFixtures)
            expect(await factory.owner()).to.equal(deployer.address)
        })
    })

    describe("Creating tokens", function() {
        it("Shoud set the owner", async function(){
            const { factory, token } = await loadFixture(deployFactoryFixtures)
            expect(await token.owner()).to.equal(await factory.getAddress())
        })
    })


})
