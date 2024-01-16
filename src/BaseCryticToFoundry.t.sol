// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test} from "forge-std/Test.sol";
import {BaseTargetFunctions} from "./BaseTargetFunctions.sol";
import {FoundryAsserts} from "./FoundryAsserts.sol";

abstract contract BaseCryticToFoundry is Test, BaseTargetFunctions, FoundryAsserts {
    function setUp() public {
        setup();
    }
}
