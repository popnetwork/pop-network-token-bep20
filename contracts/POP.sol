// SPDX-License-Identifier: MIT

pragma solidity ^0.6.12;

import './BEP20.sol';
import '@pancakeswap/pancake-swap-lib/contracts/access/Ownable.sol';

contract POP is Ownable, BEP20("POP Network Token", "POP") {
    
    uint public constant MAX_SUPPLY = 1600000000 * (10 ** 18);
    
    constructor() public {    
        _mint(msg.sender, MAX_SUPPLY);
    }

    function mint(address _to, uint256 _amount) public onlyOwner {
        require(_amount.add(totalSupply()) <= MAX_SUPPLY, "POP: maxcap reached");
        _mint(_to, _amount);
    }

    function burn(address _to, uint256 _amount) public onlyOwner {
        _burn(_to, _amount);
    }
}