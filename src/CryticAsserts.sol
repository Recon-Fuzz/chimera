// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Asserts} from "./Asserts.sol";

contract CryticAsserts is Asserts {
    event Log(string);

    function gt(uint256 a, uint256 b, string memory reason) internal virtual override {
        if (!(a > b)) {
            emit Log(reason);
            assert(false);
        }
    }

    function gte(uint256 a, uint256 b, string memory reason) internal virtual override {
        if (!(a >= b)) {
            emit Log(reason);
            assert(false);
        }
    }

    function lt(uint256 a, uint256 b, string memory reason) internal virtual override {
        if (!(a < b)) {
            emit Log(reason);
            assert(false);
        }
    }

    function lte(uint256 a, uint256 b, string memory reason) internal virtual override {
        if (!(a <= b)) {
            emit Log(reason);
            assert(false);
        }
    }

    function eq(uint256 a, uint256 b, string memory reason) internal virtual override {
        if (!(a == b)) {
            emit Log(reason);
            assert(false);
        }
    }

    function approxEq(uint256 a, uint256 b, uint256 maxPercentDelta, string memory message) internal virtual override {
        if (b == 0) return eq(a, b, message); // If the right is 0, left must be too.

        uint256 diff = a > b ? a - b : b - a;
        uint256 percentDelta = diff * 1e18 / b;

        gt(maxPercentDelta, percentDelta, message);
    }

    function approxEq(int256 a, int256 b, uint256 maxPercentDelta, string memory message) internal virtual override {
        if (b == 0) return t(a == b, message); // If the right is 0, left must be too.

        int256 d = a - b;
        uint256 diff = d >= 0 ? uint256(d) : uint256(-d);
        uint256 base = b >= 0 ? uint256(b) : uint256(-b);

        // percentDelta = |a - b| / |b| in 1e18 precision
        uint256 percentDelta = (diff * 1e18) / base;

        gt(maxPercentDelta, percentDelta, message);
    }

    function t(bool b, string memory reason) internal virtual override {
        if (!b) {
            emit Log(reason);
            assert(false);
        }
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
        require(p);
    }
}
