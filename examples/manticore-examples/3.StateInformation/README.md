# Getting through path

For installation, please check the [Preliminaries section in first example](../1.SimpleExample/). 

### State Information

Improving the last [example](../2.ManipulateSmartContract) by generating inputs that make the `foo` function
fails. 
First, each executed transaction has a path and represented by a state. The state could be alive (THROW) or terminated (REVERT).

The list of alive states is stored in `m.running_states` and the list of the terminated states is stored in
`m.terminated_states`. All the states can be accessed from `m.all_states`.

For specific transaction state information, could be accessed as follow:

```python
for state in m.all_state:
    # print the list of all transactions for this path
    print (state.platform.transactions)
    # print the returned data by last transaction
    print (state.platform.transactions[-1].return_data)
```

## Run
```bash
docker run -t -v $(pwd):/src aabdulwahed/manticore:solc-0.5.3 python3 /src/go_through_path.py
```