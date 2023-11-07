## Chimera

Chimera is a smart contract property-based testing framework. Write once, run everywhere.

### Installation

```bash
forge install aviggiano/chimera
```

### Motivation

When writing property-based tests, developers commonly face several issues: 
- the amount of boilerplate code required
- the challenge of switching tools after the initial setup
- the difficulty in sharing results between different tools

Writing invariant tests that work seamlessly with Foundry, Echidna, Medusa, and Halmos is not straightforward. 

Chimera addresses this problem by enabling a "write once, run everywhere" approach.

### Features

- [x] Boilerplate contracts for Foundry, Echidna, Medusa, and Halmos tests
- [ ] Python installation
- [ ] `chimera init`: quickstarts a property-based testing setup for Foundry, Echidna, Medusa and Halmos
- [ ] `chimera install`: installs Foundry, Echidna, Medusa, and Halmos
- [ ] `chimera convert`: converts tx sequences from one tool to another
- [ ] `chimera TOOL`: runs a property-based testing TOOL against the framework setup
