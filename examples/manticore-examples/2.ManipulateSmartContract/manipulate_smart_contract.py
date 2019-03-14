from manticore.ethereum import ManticoreEVM

# initiate Blockchain
m = ManticoreEVM()
print(f'[+] Blockchain initialized ')
smart_contract_code = '''
pragma solidity 0.5.3;

contract SimpleExample{
    function foo(uint256 a) payable public {
        if(a == 40){
            revert();
        }
    }
}
'''

# create new user account
user_account = m.create_account(balance=1000, name='user_account')
print(f'[+] Created user account ', user_account.name_)

# initiate contract
contract_account = m.solidity_create_contract(
    smart_contract_code,
    owner = user_account
)
print(f'[+] Initiate the contract ', contract_account)

# create symbolic data and value
# symbolic data means that the manticore will explore all the
# contract functions during transaction execution
# For more information about the function selection check out this link
# https://blog.trailofbits.com/2017/11/06/hands-on-the-ethernaut-ctf/

symbolic_data = m.make_symbolic_buffer(320) # creates symbolic byte array with size = 320
symbolic_value = m.make_symbolic_value()

# execution raw transaction using m.transaction
m.transaction(
    caller = user_account,
    address = contract_account,
    data = symbolic_data,
    value = symbolic_value
)

# execute only one function
# create new symbolic value and call foo()
# if value in the transaction was not specified, the default is 0
symbolic_var = m.make_symbolic_value()
contract_account.foo(
    symbolic_var,
    caller = user_account,
    value = 0
)

m.finalize()
print(f"[+] Look for results in ", m.workspace)