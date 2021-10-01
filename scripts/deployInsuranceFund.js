const {ethers} = require('hardhat')

async function main(){
    const factory = await ethers.getContractFactory("InsuranceFundV1")
    const tx = await factory.deploy()
    console.log("deployed tx", tx);
}

main()
