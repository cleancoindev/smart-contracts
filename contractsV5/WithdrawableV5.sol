pragma solidity 0.5.11;

import "./ERC20InterfaceV5.sol";
import "./PermissionGroupsV5.sol";


contract Withdrawable is PermissionGroups {

    event TokenWithdraw(ERC20 token, uint amount, address sendTo);

    /**
     * @dev Withdraw all ERC20 compatible tokens
     * @param token ERC20 The address of the token contract
     */
    function withdrawToken(ERC20 token, uint amount, address sendTo) external onlyAdmin {
        require(token.transfer(sendTo, amount));
        emit TokenWithdraw(token, amount, sendTo);
    }

    event EtherWithdraw(uint amount, address sendTo);

    /**
     * @dev Withdraw Ethers
     */
    function withdrawEther(uint amount, address payable sendTo) external onlyAdmin {
        sendTo.transfer(amount);
        emit EtherWithdraw(amount, sendTo);
    }
}
