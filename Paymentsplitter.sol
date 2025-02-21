pragma solidity ^0.8.0;

contract PaymentSplitter {
    // Define an array of three payable addresses to receive payments
    address payable[3] recipients = [
        payable(0x1234567890123456789012345678901234567890),
        payable(0x2345678901234567890123456789012345678901),
        payable(0x3456789012345678901234567890123456789012)
    ];
    
    // Define an array representing share percentages for each recipient
    uint256[3] shares = [50, 30, 20]; // Sum must be 100%
    
    // Function to distribute received Ether among recipients based on predefined shares
    function distribute() public payable {
        // Ensure that some Ether is sent with the function call
        require(msg.value > 0, "No funds sent");
        
        // Loop through recipients and distribute Ether based on their share
        for (uint256 i = 0; i < recipients.length; i++) {
            uint256 amount = (msg.value * shares[i]) / 100; // Calculate the share for each recipient
            recipients[i].transfer(amount); // Transfer the calculated amount
        }
    }
}
