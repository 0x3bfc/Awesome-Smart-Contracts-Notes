## Standalone Exploration

### Preliminaries

- Install Docker-Engine
- Download Manticore docker-image
```bash
$ docker pull aabdulwahed/manticore:solc-0.5.3
```

### Run
```bash
$ docker run -t -v $(pwd):/src aabdulwahed/manticore:solc-0.5.3 manticore /src/contracts/SimpleExample.sol --workspace.dir /src/results/
2019-03-14 13:52:29,059: [1] m.c.manticore:INFO: Verbosity set to 1.
2019-03-14 13:52:29,118: [1] m.main:INFO: Registered plugins: DetectDelegatecall, DetectUninitializedMemory, DetectIntegerOverflow, DetectEnvInstruction, DetectReentrancySimple, DetectUnusedRetVal, DetectExternalCallAndLeak, DetectInvalid, DetectSuicidal, DetectReentrancyAdvanced, DetectUninitializedStorage
2019-03-14 13:52:29,118: [1] m.main:INFO: Beginning analysis
2019-03-14 13:52:29,119: [1] m.e.manticore:INFO: Starting symbolic create contract
2019-03-14 13:52:29,356: [1] m.e.manticore:INFO: Starting symbolic transaction: 0
2019-03-14 13:52:29,994: [1] m.e.manticore:INFO: 1 alive states, 3 terminated states
2019-03-14 13:52:30,106: [1] m.e.manticore:INFO: Starting symbolic transaction: 1
2019-03-14 13:52:30,928: [1] m.e.manticore:INFO: 1 alive states, 6 terminated states
2019-03-14 13:52:31,831: [1] m.c.manticore:INFO: Generated testcase No. 0 - STOP
2019-03-14 13:52:32,309: [137] m.c.manticore:INFO: Generated testcase No. 1 - REVERT
2019-03-14 13:52:32,571: [137] m.c.manticore:INFO: Generated testcase No. 2 - RETURN
2019-03-14 13:52:33,091: [137] m.c.manticore:INFO: Generated testcase No. 3 - REVERT
2019-03-14 13:52:33,612: [137] m.c.manticore:INFO: Generated testcase No. 4 - STOP
2019-03-14 13:52:34,453: [137] m.c.manticore:INFO: Generated testcase No. 5 - REVERT
2019-03-14 13:52:35,196: [137] m.c.manticore:INFO: Generated testcase No. 6 - REVERT
2019-03-14 13:52:35,234: [1] m.c.manticore:INFO: Results in /src/results/mcore_d3em07ev
2019-03-14 13:52:35,235: [1] m.c.manticore:INFO: Total time: 5.119769811630249
```

Check out the `results` directory
