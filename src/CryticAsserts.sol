// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Asserts.sol";

contract CryticAsserts is Asserts {
    event Log(string);

    function gt(
        uint256 a,
        uint256 b,
        string memory reason
    ) internal virtual override {
        emit Log(reason);
        assert(a > b);
    }

    function gte(
        uint256 a,
        uint256 b,
        string memory reason
    ) internal virtual override {
        emit Log(reason);
        assert(a >= b);
    }

    function lt(
        uint256 a,
        uint256 b,
        string memory reason
    ) internal virtual override {
        emit Log(reason);
        assert(a < b);
    }

    function lte(
        uint256 a,
        uint256 b,
        string memory reason
    ) internal virtual override {
        emit Log(reason);
        assert(a <= b);
    }

    function eq(
        uint256 a,
        uint256 b,
        string memory reason
    ) internal virtual override {
        emit Log(reason);
        assert(a == b);
    }

    function t(bool b, string memory reason) internal virtual override {
        emit Log(reason);
        assert(b);
    }

    function between(
        uint256 value,
        uint256 low,
        uint256 high
    ) internal virtual override returns (uint256) {
        if (value < low || value > high) {
            uint ans = low + (value % (high - low + 1));
            return ans;
        }
        return value;
    }

    function precondition(bool p) internal virtual override {
        require(p);
    }
}
