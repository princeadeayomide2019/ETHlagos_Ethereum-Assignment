const IPFSInbox = artifacts.require("./IPFSInbox.sol");
contract("IPFSInbox", accounts => {
    it("...should emit an event when you send an IPFS address.",
        async () => {
            // Wait for the contract to be deployed
            const ipfsInbox = await IPFSInbox.deployed();
            // Call the contract function which sends an IPFS address
            const result = await ipfsInbox.sendIPFS("SampleAddress", accounts[1], {
                from: accounts[0]
            });
            // Check if the variable is set to true by this time
            assert.equal(result.logs[0].args._ipfsHash, "SampleAddress",
                "Sending an IPFS request does not emit an event.");
        });
});