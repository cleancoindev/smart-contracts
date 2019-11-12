pragma solidity 0.5.11;


import "./ERC20InterfaceV5.sol";

/// @title Kyber Reserve contract
interface KyberReserveInterfaceV5 {

    function trade(
        ERC20 srcToken,
        uint srcAmount,
        ERC20 destToken,
        address destAddress,
        uint conversionRate,
        bool validate
    )
        external
        payable
        returns(bool);

    function getConversionRate(ERC20 src, ERC20 dest, uint srcQty, uint blockNumber) external view returns(uint);
}
