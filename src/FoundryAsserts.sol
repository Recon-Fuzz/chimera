// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import {Asserts} from "./Asserts.sol";

contract FoundryAsserts is Test, Asserts {
    function gt(uint256 a, uint256 b, string memory reason) internal virtual override {
        assertGt(a, b, reason);
    }

    function gte(uint256 a, uint256 b, string memory reason) internal virtual override {
        assertGe(a, b, reason);
    }

    function lt(uint256 a, uint256 b, string memory reason) internal virtual override {
        assertLt(a, b, reason);
    }

    function lte(uint256 a, uint256 b, string memory reason) internal virtual override {
        assertLe(a, b, reason);
    }

    function eq(uint256 a, uint256 b, string memory reason) internal virtual override {
        assertEq(a, b, reason);
    }

    function t(bool b, string memory reason) internal virtual override {
        assertTrue(b, reason);
    }

    function between(uint256 value, uint256 low, uint256 high) internal virtual override returns (uint256) {
        if (value < low || value > high) {
            uint256 ans = low + (value % (high - low + 1));
            return ans;
        }
        return value;
    }

    function between(int256 value, int256 low, int256 high) internal virtual override returns (int256) {
        if (value < low || value > high) {
            int256 range = high - low + 1;
            int256 clamped = (value - low) % (range);
            if (clamped < 0) clamped += range;
            int256 ans = low + clamped;
            return ans;
        }
        return value;
    }

    function precondition(bool p) internal virtual override {
        vm.assume(p);
    }
}
