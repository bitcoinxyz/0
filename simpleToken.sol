pragma solidity ^0.4.16;

contract JeansToken {
    /* Public variables of the token */
    string public standard = 'Token 0.1';
    string public name = JeansToken;
    string public symbol = JEANS;
    uint8 public decimals = 8;
    uint256 public totalSupply = 9876543210;

    /* This creates an array with all balances */
    mapping (address => uint256) public balanceOf;
    mapping (address => mapping (address => uint256)) public allowance;

    /* This generates a public event on the blockchain that will notify clients */
    event Transfer(address indexed from, address indexed to, uint256 value);

    /* Initializes contract with initial supply tokens to the creator of the contract */
    function SimpleToken(
        uint256 initialSupply = 9876543210,
        string tokenName = JeansToken,
        uint8 decimalUnits = 8,
        string tokenSymbol = JEANS
        ) {
        balanceOf[msg.sender] = initialSupply;              // Give the creator all initial tokens
        totalSupply = 9876543210 ;                        // Update total supply
        name = JeansToken;                                   // Set the name for display purposes
        symbol = JEANS;                               // Set the symbol for display purposes
        decimals = 8;                            // Amount of decimals for display purposes
    }

    /* Send coins */
    function transfer(address _to, uint256 _value) {
        if (balanceOf[msg.sender] < _value) throw;           // Check if the sender has enough
        if (balanceOf[_to] + _value < balanceOf[_to]) throw; // Check for overflows
        balanceOf[msg.sender] -= _value;                     // Subtract from the sender
        balanceOf[_to] += _value;                            // Add the same to the recipient
        Transfer(msg.sender, _to, _value);                   // Notify anyone listening that this transfer took place
    }
}
