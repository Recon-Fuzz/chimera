## Chimera

Chimera is a smart contract property-based testing framework. Write once, run everywhere.

 <a href="https://github.com/Recon-Fuzz/chimera/assets/3029017/65828e54-8c55-4292-9467-4efe94dc6347"><img src="https://github.com/Recon-Fuzz/chimera/assets/3029017/65828e54-8c55-4292-9467-4efe94dc6347" width="300"/></a>
 
### Installation

```bash
forge install Recon-Fuzz/chimera
```

### Motivation

When writing property-based tests, developers commonly face several issues: 
- the amount of boilerplate code required
- the challenge of switching tools after the initial setup
- the difficulty in sharing results between different tools

Writing invariant tests that work seamlessly with Foundry, Echidna, Medusa, and Halmos is not straightforward. 

Chimera addresses this problem by enabling a "write once, run everywhere" approach.

### Limitations

Chimera currently only supports cheatcodes implemented by [HEVM](https://hevm.dev/std-test-tutorial.html#supported-cheat-codes). 

Foundry has extended these and offers functionality not supported by the HEVM cheatcodes, subsequently these must be accounted for when adding Chimera to a Foundry project as they will cause issues when running Echidna and Medusa. If adding Chimera to an existing Foundry project ensure that there are no cheatcodes implemented that aren't supported by HEVM as they will throw the following error: `VM failed for unhandled reason, BadCheatCode <cheatcode hash>`.  

While **medusa** supports `etch`, echidna does not support it yet. Please note when using `etch` in an echidna environment it will not work as expected.

### Features

- [x] Boilerplate contracts for Foundry, Echidna, Medusa, Halmos and Kontrol tests

### Help

Join the Recon Discord: https://getrecon.xyz/discord
